## Week 01, Day 05.
### 07 / 08 / 2015

What we covered today:
- Warmup Exercise
- Demos - Geometry and Bank
- This
- Guest Talk with Amy Simmons!
- Making Objects
    + Factories
    + Constructors
- Lab: [MTA](https://gist.github.com/wofockham/8ac3c1d747f345d89d3d)

#### Warmup Exercise

Raindrops.
- [Warmup Exercise and Documented Solution](https://github.com/ga-wolf/WDI10-Homework/tree/master/warmup-exercises/week_01/raindrops)

#### This

This is one of the most powerful things in Javascript, but also one of the hardest to understand.

In Javascript, this will always refer to the owner of the function we are executing. If the function is not within an object, or another function - this will refer to the global object - or window.  Window is an object that exists in every browser, applying keys and values to this will make them globally accessible.  Don't do it regularly though.

```js
// GLOBAL THIS //
var doSomething = function () {
    console.log( this );
    // Will log the window object
}

// OBJECT THIS //
var objectFunction = {
    testThis: function () {
        console.log( this );
        // Would log the objectFunction object
    }
}
objectFunction.testThis();

// EVENT THIS //
var button = document.getElementById("myButton");
// This is a basic click handler - you aren't expected to understand this yet!
button.addEventListener( "click", function() {
    console.log( this );
    // Will log the HTML element that this event ran on (button with id myButton)
});
```

**More or less...**

In a simple function (one that isn't in another function or object) - "this" stays as the default - window.

In a function that is within an object, "this" is defined as the object - it's immediate parent.

In an event handler (a function that is called based on browser interaction), "this" is defined as the element that was interacted with.

[Lizzie the Cat example](http://repl.it/lwW)

**Further This Reading**
- [Todd Motto](http://toddmotto.com/understanding-the-this-keyword-in-javascript/)
- [MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/this)
- [Javascript is Sexy](http://javascriptissexy.com/understand-javascripts-this-with-clarity-and-master-it/)
- [Quirks Mode](http://www.quirksmode.org/js/this.html)

#### Making Objects / Constructors / Factories

First off, both constructors and factories are "blue prints".  They bootstrap development.  Often they are more hassle than they are worth though - so be wary.  Think about whether all the code to get this running efficiently is actually worth it.  Objects can get you through 95% of the time.

###### What is a constructor?

Essentially they are factories for objects.  Normally JS objects are only maps from strings to values - however JS also supports inheritance - something that is truly object-oriented.  They are quite similar to classes in other languages.

They become a constructor factory for objects if they are invoked via the new operator.

**What does it entail?**

The initial set up - this is where you set up the instance data...

```js
var Point = function ( x, y ) {
    this.x = x;
    this.y = y;
}
```

The application of methods or functions...  These will apply to any instance.

```js
Point.prototype.dist = function () {
    return Math.sqrt( this.x * this.x + this.y * this.y );
};
```

The invocation of a new instance.

```js
var p = new Point( 3, 4 );
console.log( "Point X: " + p.x );
```

We can also check to see if an object is an instance of a constructor:

```js
typeof p
// Returns "object"

p instanceof Point
// true
```

- [Phrogz](http://phrogz.net/JS/classes/OOPinJS2.html)
- [HTML5 ]

#### Homework

[MTA.](https://gist.github.com/wofockham/8ac3c1d747f345d89d3d)
[Reading list](https://gist.github.com/wofockham/8a702a9bf0a1456df7d4)