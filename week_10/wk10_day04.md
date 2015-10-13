## Week 10, Day 04
### 08 / 10 / 2015

What we covered today:
- [Warmup](https://gist.github.com/ga-wolf/c3c81080fa8d583d99fb) and [Test Suite](https://gist.github.com/ga-wolf/6099832d43d1676af95b)
  + [Solution](https://gist.github.com/Scoutski/fb97c8a9876142c07938)
- Rspec

#### Rspec

We have done a little bit of Rspec now, but it has all been with pure Ruby, no Rails.  We want to get it working with Rails, and luckily, that isn't difficult.

We need to include the gem...

` gem 'rspec-rails' ` - and make sure it goes in the development and test environments!

We then run ` bundle `.

This still hasn't installed Rspec, so we need to do that... ` rails generate rspec:install ` or just ` rails g rspec:install `.  This does a bunch of things, it generates us a spec folder (where all of our tests will live), but it also changes the behaviour for other rails generators.  It will add functionality.  For example, when you generate a model, it will now generate a test for it as well!  Same thing for controllers etc.

Now we can generate some models!  For the moment, we just want one model.  So let's run ` rails g model Fruit `.  Let's also run add a name column to that - ` rails g migration add_name_to_fruits name:string `, and run ` rake db:migrate `.

The whole purpose of this project is to make it easy to upload Fruits, whether they be apples of pears.  We could have multiple tables for these things, but we don't have to.  We can use a thing called Single Table Inheritance (S.T.I).  This is where a model (that doesn't have a table) inherits from another model (that has a database table associated).  It looks something like the following:

```rb
class Fruit < ActiveRecord::Base
end

class Apple < Fruit
end

class Pear < Fruit
end
```

Because Pear and Apple inherit from a Fruit, it means that they still inherit from ActiveRecord::Base.

This structure of inheritance means that we can create Fruits, Apples or Pears and it still makes a record in the Fruits table.

` pear = Pear.new ` or ` apple = Apple.new `.  That will work, but our biggest problem is that we can never figure out which it started off as after this line - whether it is an apple or a pear.  We need to do a migration for this.  ` rails g migration add_type_to_fruits type:string ` will sort this out for us. Type is something that is automatically sorted out for us, so never actually assign a type column, let Rails do it for us.

To test this out we could have a block in our Rspec tests.

```rb
Rspec.describe Shelf, :type => :model do
  describe "A pear" do
    before do
      @pear = Pear.create :name => "Nashi"
    end

    it "should remember the class via Single Table Inheritance (S.T.I)" do
      pear = Fruit.find( @pear.id )
      expect( pear.class ).to eq Pear
      expect( pear ).to eq @pear
      expect( pear.is_a?( Fruit ) ).to be true
      expect( pear.class.ancestors ).to include Fruit
    end
  end
end
```

And that should be all sorted!  Single Table Inheritance doesn't regularly come up so if it is seeming a bit weird, don't worry about it.  Neither Joel nor I have ever used it professionally.  But it is cool to show how to test that sort of stuff, and it shows why type is a reserved column name in a database.

One thing that you might be interested in, is testing associations in Rails.  Unfortunately Rspec doesnt have something that automates this.  To test associations, use a gem called [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers).

In the test environment place this in the Gemfile - ` gem 'shoulda-matchers' ` - and run ` bundle `.

Let's create a shelf table to house all of our fruits - ` rails g model Shelf ` - and run the migration.  We need to tell the Fruit model that it belongs a shelf - add this ` belongs_to :shelf `, and we also need to tell the Shelf that it has many fruits - ` has_many :fruits `.

To test these associations...

```rb
# Put this at the top of the thing describing fruits
it { should belong_to :shelf }

# Put this at the top of the thing describing shelves
it { should have_many :fruits }
```

Now obviously we have started to get lots and lots of tests.  We need to start keeping track of our test coverage!  Lets add a gem called [Simplecov](https://github.com/colszowka/simplecov).  Add this into your Gemfile (again, in the test environment) - ` gem 'simplecov', :require => false `.  Then run ` bundle `.

Then add, at the top of your spec_helper.rb file, the following lines:

```rb
require 'simplecov'
SimpleCov.start
```

This will generate everything we need!  Open up the coverage/index.html file in the browser and you will see everything that it tests.

We have only tested models so far, so lets figure out how to test controllers.  Let's generate a fruits controller - ` rails controller fruits `.  We want a route for "/fruits" as well (where we will show all of our fruits).  To do that, let's use ` resources :fruits `.  The next error that pops up will be that the action doesn't exist, so lets add an index method in the fruits_controller.  After that, we will have a missing template (or view), so let's make that file as well.  Bare in mind that all of the following tests should be in a fruits_controller_spec.rb.

```rb
RSpec.describe FruitsController, :type => :controller do
  describe "GET /fruits" do
    before do
      3.times { |i| Fruit.create :name => "Fruit number #{ i }" }
    end

    describe "As HTML" do
      it "should respond with a status of 200 OK" do
        expect( response ).to be_success
        expect( response.status ).to eq( 200 )
      end

      it "should respond with @fruits that contains all fruits in reverse order" do
        # We need to do a bit of work in the controllers for this.  Add @fruits = Fruit.all.reverse into the index method.

        # Remember that this all runs of the before block.

        # Checks existence
        expect( assigns( :fruits ) ).to be

        # Checks how many things are in @fruits
        expect( assigns( :fruits ).length ).to eq 3


        expect( assigns( :fruits ).first.class ).to eq( Fruit )

        # Validates whether it is in reverse order.
        expect( assigns( :fruits ).first.name ).to eq( "Fruit number 2" )
      end

      it "should render the index view" do
        expect( response ).to render_template( :index )
      end
    end
  end
end
```

That will work for normal HTML, but what if we wanted to test JSON responses?  Lets add some tests.

```rb
describe "As JSON" do
  before do
    get :index, :format => :json
  end

  it "should response with a status 200 OK" do
    expect( response ).to be_success
    expect( response.status ).to eq(200)
  end

  it "should have the right content type" do
    expect( response.content_type ).to eq( "application/json" )
  end

  it "should provide the fruit name" do
    # response.body returns a string so we need to turn it into an actual object
    fruit = JSON.parse( response.body )
    expect( fruits.length ).to eq( 2 )
    expect( fruits.first['name'] ).to eq( "Fruit number 2" )
  end
end
```

In the index method in the controller, lets use this code.

```rb
@fruits = Fruit.all.reverse
respond_to do |format|
  format.html {}
  format.json { render :json => @fruits }
end
```

That should work out the errors!

_A Bit more on Running Rspec_

- ` rspec ` - Run all tests
- ` rspec spec/models ` - Run all model tests
- ` rspec spec/controllers ` - Run all controller tests
- ` rspec -e "The description of the test you want to run" ` - Tell it an individual test to run.