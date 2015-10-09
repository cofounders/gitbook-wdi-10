## Week 10, Day 04
### 02 / 07 / 2015

What we covered today:
- [Warmup](https://gist.github.com/ga-wolf/6d27f68d17f55be6bba9) and [Test Suite](https://gist.github.com/ga-wolf/c7e388f34e84e5af36d9)
    + [Solution](https://gist.github.com/ga-wolf/8aee420f3ae75e0fbd00)
- Rspec
- Cucumber
- Capybara
- [Homework](https://gist.github.com/wofockham/fdde9bf5cef866f8ef27)

#### Rspec

So we are getting through all of this Rspec stuff but so far we have only done things like GET requests and checked existence of variables.  Now we need to sort out validations such as Post requests and seeing how the page is actually rendered. It isn't overly difficult!  This is a really basic version of it.

```rb
describe 'POST /fruits' do
  describe "A fruit with valid information" do
    before do
      post :create, { fruit: { name: "Strawberry" } }
    end

    it "should redirect to the show action" do
      # pending # Don't actually run this test!
      expect( response ).to redirect_to( fruit_path( assigns(:fruit) ) )
    end

    it "should increase the number of fruits in the database"
      # pending
      expect( Fruit.count ).to eq( 1 )
    end
  end

  describe "A fruit with invalid information" do
    before do
      post :create, { fruit: { name: "" } }
    end

    it "should give us a 200 success status" do
      # pending
      expect( response.status ).to eq( 200 )
    end

    it "should render the new template" do
      # pending
      expect( response ).to render_template( :new )
    end

    it "should not increase the number of fruits" do
      pending
      expect( Fruit.count ).to eq( 0 )
    end
  end
end
```

The rails scaffold generates some pretty great tests, so make sure you check that out.

Worth checking out [betterspecs](http://betterspecs.org/) as well.

#### Cucumber

Cucumber is a higher level testing framework for Ruby.  Similar approach but we write something that looks a lot more like English.  Let's install the gem - ` gem install cucumber `.

Unlike Rspec, these tests belong in a features folder (in the root path of your project).  To run these tests, run ` cucumber `.

This is what it looks like...

```
Feature: Calculator
  As a young ambitious developer
  I want to experiment with Cucumber
  And add some numbers together

  Scenario: Add two numbers together
    Given I have a calculator
    And I have the number 5
    And I have the number 7
    When I add them together
    Then I should see the number 12 in the terminal
```

Now Ruby doesn't understand English so we need to do a bit more work.  We need to create step definitions and teach it how to understand them.  We do this in a step_definitions folder, lets call the file calculator_steps.rb.  To get the code to copy into the file, run ` cucumber ` and copy all of the yellowish code into it (and, of course, save).

Now most of this requires a calculator.  So let's create a calculator.rb file in the root directory.  This is where we create our class and put all of our methods.

We put all the requirements for our app in the features/support/setup.rb file.  In here, for this example, let's make the file look like this.  We need to make sure that we reference all necessary Ruby files and gems.

```rb
require_relative '../../calculator'
require 'minitest/autorun'
require 'test/unit'
World(Test::Unit::Assertions)
```

Make sure you run ` gem install cucumber `, ` gem install minitest ` and ` gem install test-unit ` before you try running ` cucumber ` again.

- As Cucumber doesn't actually know English (which is a shame), we need to teach it what the tests actually mean - so let's have a look at the calculator_steps.rb file.
  ```
  Given(/^I have a calculator$/) do
    @calculator = Calculator.new
  end
  ```
- It'll then say there is an uninitialized constant or a NameError. This means that we haven't defined the class Calculator in our calculator.rb file. Let's go ahead and do that.
  ```rb
  class Calculator
  end
  ```
- That first one should now pass. So let's do the next step:
  ```rb
  Given(/^I have the number (\d+)$/) do |num|
    @calculator << num
  end
  ```
- It will say it doesn't know how to use << operator on @calculator, and that is because we haven't defined that method. So let's work on that!  We have created the << method and that pushes a specified number in the input array. That should get us through!
  ```rb
  class Calculator
    def initialize
      @input = []
    end

    def <<(number)
      @input << number.to_i
    end
  end
  ```
- Now let's teach Cucumber how to add!
  ```rb
  When(/^I add them together$/) do
    @result = @calculator.add
  end
  ```
- And then define the add method
  ```rb
  def add
    # @input.inject { |sum, n| sum + n }
    @input.inject &:+
  end
  ```

This is what this project looks like that so check [this out.](https://github.com/wofockham/wdi-9/tree/master/10-advanced/calculator)

###### Cucumber with Rails

Create a new Rails project ( ` railes new cucky -T ` ) and put a few things in your Gemfile.

```
group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
end
```

And then run ` rails generate cucumber:install `.

That will do all of the necessary steps.  We can just add the features from there!  To run the tests, we can run ` cucumber ` or ` rake cucumber `.

It's a similar process for Cucumber with Rails compared to Cucumber with plain Ruby. Make your features - make them pass!

###### Capybara comes with Cucumber in Rails

Capybara is a way to interact with a browser.  This is really handy for testing!

You can do things like the following:

```rb
visit "/users/sign_up"

fill_in 'Email', with: email
fill_in 'Password', with: 'chicken'
fill_in 'Password confirmation', with 'chicken'

click_button 'Sign in'
```

But also a whole heap of other things...

```
click_link('id-of-link')
click_link('Link Text')
click_button('Save')
click_on('Link Text') # clicks on either links or buttons
click_on('Button Value')

fill_in('First Name', :with => 'John')
fill_in('Password', :with => 'Seekrit')
fill_in('Description', :with => 'Really Long Text...')
choose('A Radio Button')
check('A Checkbox')
uncheck('A Checkbox')
attach_file('Image', '/path/to/image.jpg')
select('Option', :from => 'Select Box')

page.has_selector?('table tr')
page.has_selector?(:xpath, '//table/tr')

page.has_xpath?('//table/tr')
page.has_css?('table tr.foo')
page.has_content?('foo')

expect(page).to have_selector('table tr')
expect(page).to have_selector(:xpath, '//table/tr')

expect(page).to have_xpath('//table/tr')
expect(page).to have_css('table tr.foo')
expect(page).to have_content('foo')

find_field('First Name').value
find_link('Hello').visible?
find_button('Send').click

find(:xpath, "//table/tr").click
find("#overlay").find("h1").click
all('a').each { |a| a[:href] }

find('#navigation').click_link('Home')
expect(find('#navigation')).to have_button('Sign out')

within("li#employee") do
  fill_in 'Name', :with => 'Jimmy'
end

within(:xpath, "//li[@id='employee']") do
  fill_in 'Name', :with => 'Jimmy'
end

within_fieldset('Employee') do
  fill_in 'Name', :with => 'Jimmy'
end

within_table('Employee') do
  fill_in 'Name', :with => 'Jimmy'
end

facebook_window = window_opened_by do
  click_button 'Like'
end
within_window facebook_window do
  find('#login_email').set('a@example.com')
  find('#login_password').set('qwerty')
  click_button 'Submit'
end

page.execute_script("$('body').empty()")

result = page.evaluate_script('4 + 4');

accept_alert do
  click_link('Show Alert')
end

dismiss_confirm do
  click_link('Show Confirm')
end

accept_prompt(with: 'Linus Torvalds') do
  click_link('Show Prompt About Linux')
end

save_and_open_page

print page.html

page.save_screenshot('screenshot.png')

save_and_open_screenshot

click_link("Password") # also matches "Password confirmation"
Capybara.exact = true
click_link("Password") # does not match "Password confirmation"
click_link("Password", exact: false) # can be overridden
```

