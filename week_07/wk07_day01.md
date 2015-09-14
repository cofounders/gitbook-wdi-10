## Week 07, Day 01
### 01 / 09 / 2015

What we covered today:
- [Hamming Distance Warmup](https://gist.github.com/ga-wolf/124081337839f06753b8)
    + [Solution](https://github.com/ga-wolf/WDI10-Homework/tree/master/warmup-exercises/week_07/hamming_distance)
- Presentations
- TDD
- Callbacks
- AJAX / XHR
- Movies III - Army of Darkness

#### Testing

Testing is huge in the Ruby and Rails communities.  It came out with Rails version 1 and has been a big part ever since.  Following the principles of T.D.D (Test Driven Development) is completely vital for large apps for tiny changes can change everything (as you all now know).  It is also vital because your final project needs to have 100% test coverage.

You normally follow the "Red-Green-Refactor Cycle".  Write the tests, let them fail first, make them pass, then refactor if necessary.

The most common testing suite for Ruby is [Rspec](http://rspec.info/).

Install that! ` gem install rspec `.

Let's create a new project. ` mdkir tdd-bank && cd tdd-bank `. In a non-Rails environment, i.e. pure Ruby, we need to do a few things to get it the testing suite working.  Run ` rspec --init `.  This will make a spec folder and a .rspec file for us.  The .rspec has all our configurations and the spec_helper is the thing that kicks everything off for us.

**So, what does it actually look like?**

Let's make a bank_spec.rb file to show how this all works.

```
| spec
|    | bank_spec.rb
|    | spec_helper.rb
| .rspec
| bank.rb
```

```rb
describe Bank do
  # This sets up a description of a class (i.e. it will search for a class with the name Bank)
end
```

But, there isn't a bank anywhere so you need to require the necessary files!  You do this by adding ` require_relative "../bank" ` at the very top of the file.

We need to actually test individual pieces of everything in here (make sure they are tiny bits at a time!).

```rb
require_relative "../bank"

describe Bank do
  let (:bank) { Bank.new( 'TDD Bank' ) }
  # This is like a before_action, it will run everytime any new describe gets run.

  describe ".new" do
    # Class methods are prefixed by a dot when describing them
    it "Creates a new Bank object" do
      expect( bank ).to_not eq nil
    end
  end

  describe "#create_account" do
    it "Can create a new account" do
      # yadda yadda yadda
    end
  end
end
```

Basically, testing is broken up into lots of little bits.  A describe block for the class as a whole, describe blocks for each individual class and instance method (remember that class methods are prefixed with a . and instace methods are prefixed with a #), and then for each small piece - you should have "it" blocks.

Remember to run all of this crazily regularly, just run ` rspec `.

