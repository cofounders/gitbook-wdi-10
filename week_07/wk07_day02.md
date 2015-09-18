## Week 07, Day 02
### 15 / 09 / 2015

What we covered today:
- [Warmup](https://gist.github.com/ga-wolf/93a4e7b6ed1c02226c54)
    + [Solution](https://github.com/ga-wolf/WDI10-Homework/blob/master/warmup-exercises/week_07/atbash-cipher/main.js)
- AJAX with jQuery
- Turbolinks

#### AJAX with jQuery

_What is AJAX?_

Even if you haven't heard of AJAX before, you definitely would have used an AJAX-based application somewhere along the way - Gmail for example.  It stands for Asynchronous Javascript And XML (XML - stands for Extensible Markup Language) and it is a technique for handling external data through Javascript asynchronously without reloading the entire page.

_How to do it_

There are so many ways.  The most flexible is using a function called $.ajax...  $.ajax has been around since jQuery 1.0.  All of the other AJAX functions that you can use with jQuery use this behind the scenes.

```js
// It can look like the following...
$.ajax( url, { OPTIONS } );
// e.g.
$.ajax( "/stats", { method: "GET" } );

// But this is the preferred way!
$.ajax({ OPTIONS });
```

For a more complex example...

```js
// Using the core $.ajax() method
$.ajax({

    // The URL for the request
    url: "/post",

    // The data to send (will be converted to a query string)
    data: {
        id: 123
    },

    // What type of request it is
    type: "GET",

    // The type of data we expect back
    dataType : "json",

    // Code to run if the request succeeds;
    // the response is passed to the function
    success: function( data ) {
        $( "<h1>" ).text( data.title ).appendTo( "body" );
        $( "<div class=\"content\">").html( data.html ).appendTo( "body" );
    },

    // Code to run if the request fails; the raw request and
    // status codes are passed to the function
    error: function( xhr, status, errorThrown ) {
        alert( "Sorry, there was a problem!" );
        console.log( "Error: " + errorThrown );
        console.log( "Status: " + status );
        console.dir( xhr );
    },

    // Code to run regardless of success or failure
    complete: function( xhr, status ) {
        alert( "The request is complete!" );
    }

});
```

We could also use promises for this, instead of encapsulating the handlers (success, error etc.), we can chain functions and jQuery promises us that these will get run.

```js
$.ajax({...}).always(function () {
    // This will always run
}).done( function (data) {
    // This will run on success
}).fail( function (data) {
    // This will run if there is an error
});
```

For more information, see [here](https://learn.jquery.com/ajax/jquery-ajax-methods/) and [here](http://api.jquery.com/jquery.ajax/).

jQuery also provides lots of convenience methods if you don't need something quite as customizable as $.ajax.  These include:

- [$.get](http://api.jquery.com/jQuery.get/)
- [$.getJSON](http://api.jquery.com/jQuery.getJSON/)
- [$.getScript](http://api.jquery.com/jQuery.getScript/)
- [$.post](http://api.jquery.com/jQuery.post/)
- [$.load](http://api.jquery.com/load/)

They are worth getting to know.

[Check this thing out!!!](http://jqfundamentals.com/chapter/ajax-deferreds)

###### Same Origin Policy

Same Origin Policy - your javascript can only talk to the current domain (the server that this site is loaded from).  If you try and talk to another domain, it might respond with a 'No Cross-Origin Resource Sharing' error (or CORS).

There are three ways to deal with this:
- Allow CORS (like OMDB API)
- Support JSONP
- The sight can host your code

This is called a CORS error, and is a really hard one to deal with.

#### Turbolinks

_What is it?_

Turbolinks, as you might image, makes your links turbo.  It is made to make following links in your application faster.  Instead of letting the browser get all HTML, CSS and Javascript again, it uses AJAX and just replaces the things that are necessary - changes the title of the page and fills in the body tag with whatever is necessary.

_What is wrong with it?_

- It can bloat your javascript memory. It doesn't destroy variables and that means that everything you have ever defined exists for as long as a user uses the site.
- It means things like $(document).ready etc. won't work - which is my major gripe with it.
- Events can end up being added lots and lots of times
- setIntervals and setTimeouts can end up still running
- Turbolinks will store the last 10 pages that were loaded, which can be good, but it means your Javascript keeps all of these details in it
- Requires ridiculous amounts of CSS specificity if you are working with some of the things it provides

Because of all of this stuff, it means that you have to write javascript very differently when dealing with Turbolinks.

_Using it..._

As previously mentioned, Turbolinks doesn't completely refresh the page - which means that we can't rely on $(document).ready running.  To solve this, Turbolinks triggers alternate events on the document object.

The important events...

- page:fetch - Starting to fetch a new page
- page:receive - The page has been received but not parsed
- page:change - The page has been changed to the new version
- page:load - Fired at the end of the loading process ( the same as $(document).ready )

The one that you would see most is this...

```js
$(document).on("ready page:load", function () {  });
```

**Caching with Turbolinks**

```js
Turbolinks.pagesCached(); // Returns how many pages are cached
Turbolinks.pagesCached(20); // Sets how many pages are allowed to be cached

Turbolinks.cacheCurrentPage();
// If you are going to be dynamically adding stuff with AJAX, you can cache a page at a particular point using this function

// Up until now, the pages are loaded instantaneously if they are cached.  What happens if we want it to load straight away and then fetch it just in case?  We run the following line of code...
Turbolinks.enableTransitionCache();
```

**Disabling Turbolinks on a Page or particular Links**

```html
<!-- On a particular link -->
<a href="/">Home (via Turbolinks)</a> <!-- Will use Turbolinks -->
<a href="/" data-no-turbolink>Home (via Turbolinks)</a> <!-- Won't use Turbolinks -->

<div id="some-div" data-no-turbolink> <!-- None of the a tags within will use turbolinks -->
  <a href="/">Home (without Turbolinks)</a>
  <a href="/">Home (without Turbolinks)</a>
  <a href="/">Home (without Turbolinks)</a>
</div>

<!--
If you find that a page is causing problems, you can have Turbolinks skip displaying the cached copy by adding data-no-transition-cache to any DOM element on the offending page.
-->
```

**The Turbolinks Progress Bar**

Because it skips the browser reload, it won't show the traditional loading bar. Turbolinks gives you the capability in javascript though.

```js
Turbolinks.ProgressBar.disable();
Turbolinks.ProgressBar.enable();
```

The Progress Bar is added to the HTML element's pseudo :before element.  It can easily be customized with CSS so it looks as you want it to.

```css
html.turbolinks-progress-bar::before {
  background-color: red !important;
  height: 5px !important;
}
```

To manually control the progress bar with javascript...

```js
Turbolinks.ProgressBar.start();
Turbolinks.ProgressBar.advanceTo(value); // where value is between 0-100
Turbolinks.ProgressBar.done();
```

**Allowing Particular Links to use Turbolinks**

Only .html files are cached by default with Turbolinks.  If you want to do other stuff...

```js
Turbolinks.allowLinkExtensions();                 // => ['html']
Turbolinks.allowLinkExtensions('md');             // => ['html', 'md']
Turbolinks.allowLinkExtensions('coffee', 'scss'); // => ['html', 'md', 'coffee', 'scss']
```

Also! Turbolinks is the last click handler to be added to any element so things like event.preventDefault, event.stopPropagation and event.stopImmediatePropagation will work.  This also means that you can still use jquery-ujs (Unobtrusive Javascript - something that comes with Rails) without issues - data-remote, data-confirm, and data-method will all still work.

**Working with jQuery**

If you have a lot of existing jQuery and it all works due to $(document).ready or other stuff that is no longer working, there is a gem called jquery-turbolinks that can help out.

_Steps for getting this working..._

- Add this to your gemfile - gem 'jquery-turbolinks'
- Run Bundle
- Add this stuff to your application.js file (in this order!)
    ```js
    //= require jquery
    //= require jquery.turbolinks
    //= require jquery_ujs
    //
    // ... your other scripts here ...
    //
    //= require turbolinks
    ```

See [here](https://github.com/kossnocorp/jquery.turbolinks) for more information.

**Tracking Assets**

By adding **data-turbolinks-track** to a link or script tag.  It will always check to see if anything has changed.  If the file has changed, it will load the whole page without using Turbolinks.  (This will cause the full files to be loaded twice though - once to check if there is a change, and then again if there is a change).

**Evaluating Script Tags**

Script tags will always be evaluated when using Turbolinks (as long as they don't have a type attribute or the type attribute is equal to text/javascript).

If we only want script tags to be evaluated the first time...

```html
<script type="text/javascript" data-turbolinks-eval=false>
    console.log("I'm only run once on the initial page load");
</script>
```

Turbolinks won't evaluate script tags on back/forward navigation unless they have data-turbolinks-eval="always" on it.

```html
<script type="text/javascript" data-turbolinks-eval=always>
    console.log("I'm run on every page load, including history back/forward");
</script>
```

**Triggering Turbolinks**

You can use ` Turbolinks.visit(path) ` to go to a URL through Turbolinks.

You can also use ` redirect_to path, turbolinks: true ` in Rails to perform a redirect via Turbolinks.


Although there is a lot of stuff going on with Turbolinks, if you are writing a Javascript-heavy application it is definitely best to avoid it.  If you want more information about Turbolinks though, see [here.](https://github.com/rails/turbolinks)