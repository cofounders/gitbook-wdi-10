## Week 02, Day 04.
### 13 / 08 / 2015

What we covered today:
- [Anagram Warmup](https://gist.github.com/avenoir/2b7b98bafdcf318a63f7)
  + [Solution](https://github.com/avenoir/WDI10-Homework/tree/master/warmup-exercises/week_02/anagram)
- [jQuery](http://jquery.com/)
- Lab
    + Cat Shelter
    + GA Bank
    + [Try Jquery](http://try.jquery.com/)

#### Javascript Libraries

_What is a Library?_

A collection of reusable methods for a particular purpose.  You just reference a javascript file with a particular library in it - and away you go!

jQuery is the most common library...

Have a crack at [these exercises.](http://www.teaching-materials.org/jquery/)

#### jQuery

_What is it?_

An open source JavaScript library that simplifies the interaction between HTML and JavaScript.  A Javascript library is collection of reusable methods for a particular purpose.

It was created by John Resig in 2005, and released in January of 2006.

Built in an attempt to simplify the existing DOM APIs and abstract away cross-browser issues.

_Why pick jQuery?_

- Documented
- Lots of libraries
- Small-ish size (23kb)
- Everything works in IE 6+, Firefox 2+, Safari 3+, Chrome, and Opera 9+ (if you are using 1.11.3 or previous, greater than that scraps up until IE8 support)
- Millions and millions of sites using it. According to BuiltWith.com, 52,339,256 live sites are using it. 26.95% of sites apparently use it.

_What does it do for us?_

- Data Manipulation
- DOM Manipulation
- Events
- AJAX
- Effects and Animation
- HTML Templating
- Widgets / Theming
- Graphics / Chart
- App Architecture

_Why use it?_

```js
// No library:
var elems = document.getElementsByTagName("img");
for (var i = 0; i< elems.length; i++) {
  elems[i].style.display = "none";
}

// jQuery:
$('img').hide();
```

_The Basics_

Select -> Manipulate -> Admire

```js
var $paragraphs = $("p")
$paragraphs.addClass('special');

// OR
$("p").addClass("special");
```

How to select things?  All CSS selectors are valid, plus a [whole heap more](http://api.jquery.com/category/selectors/).

Some common ones are:

- :first
- :last
- :has()
- :visible
- :hidden

_Reading Elements_

If we had this element in the HTML...

`<a id="yahoo" href="http://www.yahoo.com" style="font-size:20px">Yahoo!</a>`

We can select it using `$("a#yahoo")`

We can store it using `var $myLink = $("#yahoo");`

We can get the content within it using `$("#yahoo").html()`

We can get the text within it using `$("#yahoo").text()`

We can get the HREF attribute using `$("#yahoo").attr("href")`

We can get the CSS attribute using `$("#yahoo").css('font-size')`

_Changing Elements_

`$("#yahoo").attr("href", "http://generalassemb.ly")`

`$("#yahoo").css("font-size", "25px")`

`$("#yahoo").text("General Assembly")`


_Create, Manipulate and Inject_

```js
// Step 1: Create element and store a reference
    var $para = $('<p></p>'); // You can create any element with this!

// Step 2: Use a method to manipulate (optional)
    $para.addClass('special'); // So many functions you could use

// Step 3: Inject into your HTML
    $('body').append($para); // Also could use prepend, prependTo or appendTo as well
```


_Regular DOM Nodes to jQuery Objects_

```js
var $paragraphs = $('p'); // an array

var myParagraph = paragraphs[0]; // a regular DOM node

var $myParagraph = $( paragraphs[0] ); // a jQuery Object
// or
var $myParagraph = $paragraphs.el(0); // This is the preferred method!

// We can also loop through our array...
for( var i = 0; i < paragraphs.length; i++ ) {
   var element = paragraphs[i];
   var paragraph = $(element);
   paragraph.html(paragraph.html() + ' wowee!!!!');
};

// Or use jQuery to do it - this is preferred
$paragraphs.each(function () {
  var $this = $( this );
  $this.html( $this.html() + " wowee!!!" );
});
```


_The Ready Event_

```js
$(document).ready(function(){

});
```

In order to do cool jQuery stuff, we need to make sure that all of the content so put all your DOM related jQuery code in the document ready.