## Week 02, Day 05.
### 14 / 08 / 2015

What we covered today:
- [Beer Bottles Warmup](https://gist.github.com/avenoir/3bb2795dfdb1cd13094d)
  + [Solution](https://github.com/avenoir/WDI10-Homework/tree/master/warmup-exercises/week_02/beer-song)
- Cat Demos
- More jQuery
- Plugins
- Happy Hour

#### Events

```js
var onButtonClick = function() {
  console.log('clicked!');
};

$('button').on('click', onButtonClick); // Attaching an event handler with a defined function to the button

$('button').on('click', function () { // Attaching an event handler with an anonymous function to the button
  console.log('clicked!');
});

$('button').click(onButtonClick)
```

_Other Event Types_

- Keyboard Events - 'keydown', 'keypress', 'keyup'
- Mouse Events - 'click', 'mousedown', 'mouseup', 'mousemove'
- Form Events - 'change', 'focus', 'blur'

Arguments get passed into callbacks by default.

```js
var myCallback = function (event) {
    console.log( event );
    // The event parameter is a big object filled with ridiculous amounts of details about when the event occurred etc.
};

$('p').on('mouseenter', myCallback);
```


_Preventing Default Events_

```js
$('a').on('click', function (event) {
    event.preventDefault();
    console.log('Not going there!');
});
$('form').on('submit', function (event) {
    event.preventDefault();
    console.log('Not submitting, time to validate!');
});
```


_Effects and Animations_

```js
$('#error').toggle(1000);

$('#error').fadeIn();

$('#error').show(1000, function(){
    $(this).addClass('redText')
});
```


_jQuery Patterns and Anti-Patterns_

```js
// Pattern: name variables with $
var $myVar = $('#myNode');

// Pattern: bind events to the document or "body"
$("body").on('click', 'a', myCallback);

// Storing References
// Pattern: store references to callback functions
var myCallback = function(argument) {
  // do something cool
};

// $(document).on('click', 'p', myCallback);

// Anti-pattern: anonymous functions
$("body").on('click', 'p', function(argument) {
  // do something anonymous
});
```


_Chaining jQuery Functions_

```js
banner.css('color', 'red');
banner.html('Welcome!');
banner.show();

// Is the same as:
banner.css('color', 'red').html('Welcome!').show();

// Is the same as:
banner.css('color', 'red')
      .html('Welcome!')
      .show();
```

Read [here](http://learn.jquery.com/) for more information

Have a crack at [these exercises.](https://gist.github.com/wofockham/a834abbcf9b3c542a1c3)

#### [Plugins with jQuery](http://plugins.jquery.com/)

_To Find Plugins_

- Go through [the jQuery plugin website](http://plugins.jquery.com/)
- Or [here](https://www.javascripting.com/), I prefer this one

_How to select a good plugin_

- Well documented
- Flexible
- Community
    + Number of forks and issues
- Actively maintained?
- File size
- Browser compatibility
- Responsive

For more details, go [here.](http://blog.pamelafox.org/2013/07/which-javascript-library-should-i-pick.html)

_How to use a plugin_

- Download the plugin and associated files from the site or Github repository
- Copy them into your project folder
- In the HTML, reference any associated CSS
- After you reference jQuery, and before you reference your own code - add the script tag that references the plugins JS file(s)

Give [this a go](http://www.teaching-materials.org/jquery2/exercises/exercise_plugin.html)

