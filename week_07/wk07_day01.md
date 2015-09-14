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

#### Callbacks and Scope

Callbacks are ridiculously important in Javascript.  They are absolutely everywhere and it is really important to get a solid understanding of them.  Remember that javascript is an asynchronous programming language, more than one thing can happen at once.

There are a couple of keys to understanding them...

**The Problem with Asynchronous Javascript**

```js
var do_first = function () {
    console.log("The do_first function was called");
}

var do_second = function () {
    console.log("The do_second function was called");
}

do_first();
do_second();

// RESULT
// "The do_first function was called"
// "The do_second function was called"
```

So that works!  The order has been kept.  But what happens if the do_first function takes a little while longer than the do_second?

```js
var do_first = function () {
    setTimeout( function(){
        console.log("The do_first function was called");
    }, 1000 );
}

var do_second = function () {
    console.log("The do_second function was called");
}

do_first();
do_second();

// RESULT
// "The do_second function was called"
// "The do_first function was called"
```

Well that isn't ideal.  Obviously the do_first is the function that we want to have completed before the do_second.  There are a bunch of different ways around this.  Callbacks are probably the main one!

**Functions are Objects**

Well, they are!  When push comes to shove, they are Function objects created using a Function constructor.  Interestingly enough, behind the scenes - a Function object contains a random a string which contains javascript code.  Due to this fact, we can store functions as strings - and therefore pass things in as parameters.

**Passing in a Function as a Parameter**

```js
var do_first_and_second = function ( callback ) {
    console.log( "Do First." );
    callback();
}

var do_second = function () {
    console.log( "Do Second." );
}

do_first_and_second( function () {
    console.log( "Do Second." );
} );

// OR! (and this is better)

do_first_and_second( do_second );
```

To work with the timing of the things...

```js
var do_first_and_second = function ( callback ) {
    setTimeout(function () {
        console.log( "Do First." );
        callback();
    }, 1000);
}

var do_second = function () {
    console.log( "Do Second." );
}

do_first_and_second( do_second );
```

Now that we can pass functions around, we know when to call functions a lot more!  This is how things like $(document).ready... etc. work.

#### XMLHttpRequests (X.H.R - Extensible Markup Language HTTP Requests)

XHR was something that was designed by Microsoft, and something that has since been adopted by Apple, Mozilla and Google.  It is also now standardized with the [W3C.](http://www.w3.org/TR/XMLHttpRequest/)

It provides a way for us to get information from a given url without refreshing the page, it can update just a part of a page.  It's a main part of AJAX (Asynchronous Javascript And XML).

Despite the name, XMLHttpRequests can be used to retrieve any type of data - including files.

_The Approach_

- Create an instance of the XMLHttpRequest object
- Open a URL (on the instance)
- Send the Request (on the instance)

```js
var request = new XMLHttpRequest();
// request.open( "PROTOCOL", "URL" );
request.open( "GET", "http://www.a-particular-website.com" );
request.send();
```

Due to the asynchronous nature of Javascript, we need to figure out a way to retrieve the data.  On the request object, after a request has been sent, there is a readystate key.  This gets a number between 0 and 4 as its value.

- 0 - request not initialized (not sent)
- 1 - server connection established
- 2 - request received
- 3 - processing request in the browser
- 4 - request finished and the response is ready to be interacted with

We are provided with a handy "onreadystatechange" function, which will be called automatically.

```js
var request = new XMLHttpRequest();
// request.open( "PROTOCOL", "URL" );
request.open( "GET", "http://www.a-particular-website.com" );
request.send();

request.onreadystatechange = function () {
    console.log( "Ready State: " + request.readystate );
    // This will print out a number between 0 and 4
}
```

What we really want to do though, is make sure that everything has been loaded.

```js
request.onreadystatechange = function () {
    if ( request.readystate === 4 ) {
        var received_data = request.responseText;
        // This is how we access the received data.
        $( "body" ).append( received_data );
    }
}
```

There are short hands for this though.  We can always do it in a way that uses callbacks.

```js
request.onload = function () {
    // Success handler goes in here!
}
```

For more details, see [here](https://developer.mozilla.org/en/docs/Web/API/XMLHttpRequest/Using_XMLHttpRequest), [here](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest/Synchronous_and_Asynchronous_Requests) and [here.](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest)