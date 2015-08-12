## Week 02, Day 03.
### 06 / 05 / 2015

What we covered today:
- [Serge Says Warmup](https://gist.github.com/avenoir/2b7b98bafdcf318a63f7)
  + [Documented Solution](https://github.com/avenoir/WDI10-Homework/tree/master/warmup-exercises/week_02/serge_says)
- [Javascript Function Review](http://www.teaching-materials.org/jsweb/slides/review.html)
- The Document Object Model (DOM)
    + Events
    + Selectors
    + Timers
    + Callbacks
- Homework
    + Dancing Cats

#### The Document Object Model (DOM)

_What is the DOM?_

It's the HTML that you wrote, when it is parsed by the browser.  After it is parsed - it is known as the DOM.  It can be different to the HTML you wrote, if the browser fixes issues in your code, if javascript changes it etc.

_How do we use it?_

The document object gives us ways of accessing and changing the DOM of the current webpage.

General strategy:
- Find the DOM node using an access method
- Store it in a variable
- Manipule the DOM node by changing its attributes, styles, inner HTML, or appending new nodes to it.

[Here are some exercises to test this stuff.](https://gist.github.com/wofockham/894b9a5e05a971e0208b)

_Get Element by ID_

```js
// The method signature:
// document.getElementById(id);

// If the HTML had:
// <img id="mainpicture" src="http://placekitten.com/200/300">
// We'd access it this way:
var img = document.getElementById('mainpicture');

// DON'T USE THE HASH!
```

_Get Elements by Tag Name_

```js
// The method signature:
// document.getElementsByTagName(tagName);

// If the HTML had:
<li class="catname">Lizzie</li>
<li class="catname">Daemon</li>
// We'd access it this way:
var listItems = document.getElementsByTagName('li');
for (var i =0; i < listItems.length; i++) {
  var listItem = listItems[i];
}
```

_Query Selector and Query Selector All_

```js
// The HTML5 spec includes a few even more convenient methods.
// Available in IE9+, FF3.6+, Chrome 17+, Safari 5+:

document.getElementsByClassName(className);
var catNames = document.getElementsByClassName('catname');
for (var i =0; i < catNames.length; i++) {
  var catName = catNames[i];
}

// Available in IE8+, FF3.6+, Chrome 17+, Safari 5+:
document.querySelector(cssQuery);
document.querySelectorAll(cssQuery);
var catNames = document.querySelectorAll('ul li.catname');
```

Remember, some of these methods return arrays and some return single things!

_Will return Single Elements_

```
getElementById()
querySelector() * returns only the first of the matching elements
  var firstCatName = document.querySelector('ul li.catname');
```

_Will return an Array_

Others return a collection of elements in an array:

```
getElementByClassName()
getElementByTagName()
querySelectorAll()
  var catNames = document.querySelectorAll('ul li.catname');
  var firstCatName = catNames[0];
```

Do [these exercises](http://www.teaching-materials.org/jsweb/exercises/domaccess.html)

**Changing Attributes with Javascript**

You can access and change attributes of DOM nodes using dot notation.

If we had this HTML:

<img id="mainpicture" src="http://placekitten.com/200/300">

We can change the src attribute this way:

```js
var oldSrc = img.src;
img.src = 'http://placekitten.com/100/500';

// To set class, use the property className:
img.className = "picture";
```

**Changing Styles with Javascript**

You can change styles on DOM nodes via the style property.

If we had this CSS:

```css
body {
  color: red;
}
```

We'd run this JS:

```js
var pageNode = document.getElementsByTagName('body')[0];
pageNode.style.color = 'red';
```

CSS property names with a "-" must be camelCased and number properties must have a unit:

```js
//To replicate this:

// body {
//   background-color: pink;
//   padding-top: 10px;
// }
pageNode.style.backgroundColor = 'pink';
pageNode.style.paddingTop = '10px';
```

**Changing an elements HTML**

Each DOM node has an innerHTML property with the HTML of all its children:

`var pageNode = document.getElementsByTagName('body')[0];`

You can read out the HTML like this:

`console.log(pageNode.innerHTML);`

```js
// You can set innerHTML yourself to change the contents of the node:
pageNode.innerHTML = "<h1>Oh Noes!</h1> <p>I just changed the whole page!</p>"

// You can also just add to the innerHTML instead of replace:
pageNode.innerHTML += "...just adding this bit at the end of the page.";
```

**DOM Modifying**

The document object also provides ways to create nodes from scratch:

`document.createElement(tagName);`

`document.createTextNode(text);`

`document.appendChild();`

```js
var pageNode = document.getElementsByTagName('body')[0];

var newImg = document.createElement('img');
newImg.src = 'http://placekitten.com/400/300';
newImg.style.border = '1px solid black';
pageNode.appendChild(newImg);

var newParagraph = document.createElement('p');
var paragraphText = document.createTextNode('Squee!');
newParagraph.appendChild(paragraphText);
pageNode.appendChild(newParagraph);
```

Have a crack at [these exercises](http://www.teaching-materials.org/jsweb/exercises/dom.html)

#### Events

_Adding Event Listeners_

In IE 9+ (and all other browsers):

`domNode.addEventListener(eventType, eventListener, useCapture);`

```js
// HTML = <button id="counter">0</button>

var counterButton = document.getElementById('counter');
var button = document.querySelector('button')
button.addEventListener('click', makeMadLib);

var onButtonClick = function() {
    counterButton.innerHTML = parseInt(counterButton.innerHTML) + 1;
};
counterButton.addEventListener('click', onButtonClick, false);
```

_Some Event Types_

The browser triggers many events. A short list:

- mouse events (MouseEvent): mousedown, mouseup , click, dblclick, mousemove, mouseover, mousewheel , mouseout, contextmenu
- touch events (TouchEvent): touchstart, touchmove, touchend, touchcancel
- keyboard events (KeyboardEvent): keydown, keypress, keyup
- form events: focus, blur, change, submit
- window events: scroll, resize, hashchange, load, unload

_Getting Details from a Form_

```js
// HTML
// <input id="myname" type="text">
// <button id="button">Say My Name</button>

var button = document.getElementById('button');
var onClick = function(event) {
    var myName = document.getElementById("myname").value;
    alert("Hi, " + myName);
};
button.addEventListener('click', onClick);
```

Get into [this exercise!](http://www.teaching-materials.org/jsweb/exercises/events.html)

#### Window

When you run JS in the browser, it gives you the window object with many useful properties and methods:

```js
window.location.href; // Will return the URL
window.navigator.userAgent; // Tell you about the browser
window.scrollTo(10, 50);
```

Lots of things that we have been using are actually a part of the window object.  As the window object is the assumed global object on a page.

```js
window.alert("Hello world!"); // Same things
alert("Hello World!");

window.console.log("Hi"); // Same things
console.log("Hi");
```

#### Animation in JS

The standard way to animate in JS is to use these 2 window methods.

To call a function once after a delay:

`window.setTimeout(callbackFunction, delayMilliseconds);`

To call a function repeatedly, with specified interval between each call:

`window.setInterval(callbackFunction, delayMilliseconds);`

Commonly used to animate DOM node attributes:

```js
var makeImageBigger = function() {
  var img = document.getElementsByTagName('img')[0];
  img.setAttribute('width', img.width+10);
};
window.setInterval(makeImageBigger, 1000);
```

#### Animating Styles

It's also common to animate CSS styles for size, transparency, position, and color:

```js
var img = document.getElementsByTagName('img')[0];
img.style.opacity = 1.0;
window.setInterval(fadeAway, 1000);
var fadeAway = function() {
  img.style.opacity = img.style.opacity - .1;
};

// Note: opacity is 1E9+ only (plus all other browsers).
//
var img = document.getElementsByTagName('img')[0];
img.style.position = 'absolute';
img.style.top = '0px';
var watchKittyFall = function() {
  var oldTop = parseInt(img.style.top);
  var newTop = oldTop + 10;
  img.style.top = newTop + 'px';
};

window.setInterval(watchKittyFall, 1000);
// Note: you must specify (and strip) units.
```

#### Stopping an Animation

To stop at an animation at a certain point, store the timer into a variable and clear with one of these methods:

```js
window.clearTimeout(timer);
window.clearInterval(timer);
```

```js
var img = document.getElementsByTagName('img')[0];
img.style.opacity = 1.0;

var fadeAway = function() {
  img.style.opacity = img.style.opacity - .1;
  if (img.style.opacity < .5) {
    window.clearInterval(fadeTimer);
  }
};
var fadeTimer = window.setInterval(fadeAway, 100);
```

Have a crack at [these exercises](http://www.teaching-materials.org/jsweb/exercises/animation.html)




#### Homework

[Here it is.](https://gist.github.com/wofockham/b4a62f016bfd241627dd)

###### The Cat Walk

Who needs Milan when you have JavaScript?

Start with this webpage, which has a single img tag of an animated GIF of a cat walking.

```html
<!DOCTYPE html>
<html>
 <head>
  <meta charset="utf-8" />
  <title>Cat Walk</title>
 </head>
 <body>

  <img style="position:absolute;" src="http://www.anniemation.com/clip_art/images/cat-walk.gif">

 </body>
</html>
```

- Create a new Javascript file and link to it with a script tag at the bottom.
- Create a variable to store a reference to the img.
- Change the style of the img to have a "left" of "0px", so that it starts at the left hand of the screens.
- Create a function called catWalk() that moves the cat 10 pixels to the right of where it started, by changing the "left" style property.
- Call that function every 50 milliseconds. Your cat should now be moving across the screen from left to right. Hurrah!

- Bonus #1: When the cat reaches the right-hand of the screen, restart them at the left hand side ("0px"). So they should keep walking from left to right across the screen, forever and ever.

- Bonus #2: When the cat reaches the right-hand of the screen, make them move backwards instead. They should keep walking back and forth forever and ever.

- Bonus #3: When the cat reaches the middle of the screen, replace the img with an image of a cat dancing, keep it dancing for 10 seconds, and then replace the img with the original image and have it continue the walk.
