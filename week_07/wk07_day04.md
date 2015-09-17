## Week 07, Day 04
### 17 / 09 / 2015

What we covered today:
- [Warmup](https://gist.github.com/27360727e8866594e3a4) and [Test Suite](https://gist.github.com/ga-wolf/3d38ef948ea392c03542)
  + [Solution](https://github.com/ga-wolf/WDI10-Homework/blob/master/warmup-exercises/week_07/wordy_calculator_one/wordy.rb)
- Demos
- Paintr
- Backbone Introduction

#### Backbone

##### The Problem

When you work on lots and lots of javascript, your files always end up all over the place - spaghetti code.  When asked to add a feature, you might just have to find a random place and give it a go.

You also end up tying your data to the D.O.M (the Document Object Model).  It's very easy, and happens ridiculously regular, that javascript applications become "tangle piles of jQuery selectors and callbacks", and they are all trying to keep data in sync between your JS, Database and the UI itself.  For rich client-side applications, a far more structured approach is necessary.

##### The Solution

Using a front end framework!  There are lots and lots of options here, this makes it difficult to pick the right one.  Here we really like Backbone.  It is unopinionated, lightweight, flexible and works brilliantly in lots of lots of situations.  Other options include Ember.js (developed by Yehuda Katz), Angular.js (a Google thing) and React.js (which is a little different - developed by Facebook).

##### Backbone - A Ridculously Brief History

Backbone was developed by Jeremy Ashkenas, the creator of Underscore.js and Coffeescript, while he was at DocumentCloud (I believe - it might have been while he was at the New York Times as well).

Worth checking out the [annotated source](http://backbonejs.org/docs/backbone.html).  Here is its [website](http://backbonejs.org/), and here is its [github.](https://github.com/jashkenas/backbone)

##### MVC x MV*

Seperation of concerns is a huge deal in programming and that is something that both the M.V.C and M.V.* approaches follow.  In a M.V.C approach, thins are broken up into:

- Models - The data
- Views - The representation
- Controller - The orchestrator

M.V.C has additional bits as well like the Router etc. This is the way that Rails works.  The M.V.* approach is a little different. It breaks everything up into:

- Models - the data
- Views - the actual User Interface
- * - Everything else. The router, collections of data etc.

##### A Brief Interlude... Literate Programming

Literate programming is a different style of programming compared to what we have seen before.  It was introduced by Donald Knuth with [this book.](https://books.google.com.au/books/about/Literate_Programming.html?id=vovpQgAACAAJ&source=kp_cover&hl=en)  It's main principle is that a program is given as an explanation of the program logic in a natural language, whether that is English or otherwise, interspersed with snippets of code.

##### The Manual Approach - Back to Backbone

Often used in conjunction with jQuery, Backbone relies on Underscore.js.  We need to include those things.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Basic Backbone App Structure</title>
</head>
<body>


    <!-- OTHER SCRIPTS. -->
    <!-- jQuery from cdnjs.com -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- underscore.js from cdnjs.com -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore-min.js"></script>
    <!-- backbone.js from cdnjs.com -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/backbone.js/1.2.1/backbone-min.js"></script>

    <!-- Your Scripts Here -->
    <script src="js/main.js"></script>
</body>
</html>
```

We need to create a seperate javascript file for all this stuff (normally we would have a lot more files than just one).  So let's create one now called ` main.js ` and reference it in the html.

```
FILE STRUCTURE!

backbone-intro
| css
| js
  | main.js
index.html
```

Models are the building blocks of Backbone. This, again, is a way to create data in a structured manner.  Models are the individual pieces (whether it is a user, animal etc.).  They look like this...

```js
var Animal = Backbone.Model.extend({  }); // This is the blueprint (or constructor)

var animal = new Animal();
```

We can put lots of stuff in here.  Defaults for example...

```js
var Animal = Backbone.Model.extend({
    defaults: {
        name      : "Generic Animal",
        ecosystem : "",
        stripes   : 0
    }
});

var animal = new Animal();
console.log( animal ); // It has the default values
```

We can also assign values quite easily.  We do this by passing the new Animal function an object.  This works even if there are default values.

```js
var Animal = Backbone.Model.extend({  });

var animal = new Animal( {
    name        : "Wolf",
    ecosystem   : "Hearts and Minds",
    stripes     : "As many as it desires"
} );
console.log( animal ); // It has all the values that we passed in
```

Now it's not ideal to console.log things, we actually want to let javascript get and set the values after creation.  We can't access the keys and values through normal notation, we use get and set.

```js
var Animal = Backbone.Model.extend({  });
var animal = new Animal( {
    name        : "Wolf",
    ecosystem   : "Hearts and Minds",
    stripes     : "As many as it desires"
} );

// To get attributes...
animal.get( "name" ); // Returns "Wolf"
animal.get( "ecosystem" ); // Returns "Hearts and Minds"

// To set attributes...
animal.set( "name", "Vargen" );
animal.set( "stripes", "earnt" );

// We can also retrieve all of it's attributes...
animal.attributes; // Returns the object itself (we can then work with it normally) - don't do it this way!
```

On creation of a new Animal, we can call a function.  We do this using an initialize function.

```js
var Animal = Backbone.Model.extend( {
    initialize: function ( new_animal ) {
        // This will run every time.
        console.log( "New animal created." );
    }
} );

var animal = new Animal(); // Will run the initialize function
```

We can also add "watchers".  Watchers wait for changes in attributes in Backbone Models and can fire functions.

```js
var Animal = Backbone.Model.extend( {
    initialize: function ( new_animal ) {
        console.log( "New animal created." );

        // This function listens for a change in the name attribute on any animal created with this Animal constructor.
        this.on( "change:name", function ( model ) {
            // We need to receive model (as a paramter) so we know which model changed.
            var type = model.get( "type" );
            console.log( "I am now a " + type );
        } );
    }
} );

var animal = new Animal( { name: "Wolf" } ); // Will fire the initialize method
animal.set( "name", "Vargen" ); // Will fire the change:name function
```

One of the greatest things about Backbone is the way that you can group models together.  We use Backbone.Collection to do this...

```js
var Animal = Backbone.Model.extend({  });
var Zoo = Backbone.Collection.extend( {
    model : Animal // We need to tell Backbone what model to use.
} );

var animal1 = new Animal();
var animal2 = new Animal();
var animal3 = new Animal();
// Create three instances of the Animal model.

var myZoo = new Zoo( [ animal1, animal2, animal3 ] );
// This creates the instance of the collection and passes in the three models we created
```

These things are now grouped.  The next great thing about Backbone is the view layer.  Views and Collections work really nice together.

```js
var Animal = Backbone.Model.extend({  });
var Zoo = Backbone.Collection.extend( {
    model : Animal // Most of the time we tell Backbone what model to use.  This helps us in the long run so do it this way
} );

var animal1 = new Animal();
var animal2 = new Animal();
var animal3 = new Animal();

var myZoo = new Zoo( [ animal1, animal2, animal3 ] );
// This creates the instance of the collection and passes in the three models

var ZooView = Backbone.View.extend( {
    el : "#main",
    // Backbone Collections work nicely with jQuery.  When you set a el key on it (like above), it will allow you to access it with el or $el (the jQuery selected version).

    initialize: function () {
        // Every time a new view is created, this will be run.
        console.log( "View Initialized" );
    },

    render: function () {
        var view = this;
        // An each loop redefines "this" so we need to keep a reference to it.  In an each loop - "this" is the current piece of the collection.  When it comes to "this", if it has a value that is actually really important and you need to keep referring to it - save it in a variable that means more.

        // view.collection gets defined when we create the new instance of the view ( a couple of lines below ).
        view.collection.each( function ( model ) {
            // Iterate through each model in the collection
            var name = model.get( "name" ); // Retrieve the current model's name
            var $h2 = $( "<h2 />" ).text( name ); // Create an h2 with the name in it
            view.$el.append( $h2 ); // Use the jQuery version of el (defined above) and append the h2 we just created.
        } );
    }
} );

var zooView = new ZooView( { collection : myZoo } ); // We pass in the collection so that the render can do what we want
```

