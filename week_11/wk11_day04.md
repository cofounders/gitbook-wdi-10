## Week 11, Day 04
### 15 / 10 / 2015

What we covered today:
- [Warmup](https://gist.github.com/ga-wolf/dbb98677f92790991e6a)
    + [Solution](https://github.com/ga-wolf/WDI10-Homework/tree/master/warmup-exercises/week_11/robot)
- YouTeach
  + Vivian
- Ivan Pakkitz
- jQuery Plugins
- Chat with [Nikita Butenko](https://twitter.com/nkbtnk) about [Open Source Projects](https://www.youtube.com/watch?v=eOynd71TzQw)
- [Interview Questions](https://gist.github.com/wofockham/e75e1fcd305a417b3e32)

#### jQuery Plugins

_But wait, what is it?_

A jQuery plugin is another method that can use to extend jQuery. We do this by attaching functions to the jQuery prototype, which means that anything that inherits from the jQuery prototype will inherit it.

The normal idea of a plugin is to do something to a collection of elements - think .hide or .fadeOut.

You can make your own, so let's figure out how to do that.

_The Real Basics of jQuery_

Before you write a plugin, you must really understand the basics of jQuery.

```js
$( "p" ).css( "color", "red" );
```

This is some relatively basic jQuery code, but what is actually happening?

- Whenever we use the $ function (or the jQuery function) to select elements, it returns a jQuery object.
  + This inherits from the jQuery prototype which in turn means that it (the prototype) contains all the methods.
  + If we want to add jQuery object methods, we need to attach them to the jQuery prototype ($.fn).

_Let's see an example_

```js
// Create a new function on the jQuery prototype called greenify.
$.fn.greenify = function() {

  // Select the element(s) that this method was called upon.
  //  Notice we don't have to select this again with jQuery - like $(this) - that is done automatically.
  this.css( "color", "green" );

  // Return the selected element(s) so that we can chain methods.
  return this;
};

$( "a" ).greenify(); // Makes all the links green.
```

Lots of additional stuff to learn with this sort of stuff - [see here.](https://learn.jquery.com/plugins/basic-plugin-creation/)