## Week 02, Day 02.
### 11 / 08 / 2015

What we covered today:
- [Warmup Exercise](https://gist.github.com/ga-wolf/7abc8be8bcc377816691)
    + [Solution](https://github.com/ga-wolf/WDI10-Homework/tree/master/warmup-exercises/week_02/nucleotide)
- Review
- [Sublime Package Control and Good Packages](../useful/package_control_and_useful_packages.md)
- Advanced CSS
    + Positioning
    + Display
    + Transitions
    + Google Fonts
    + Custom Fonts
- Semantic HTML
- [Homework](https://gist.github.com/wofockham/47097f750914f9f23644)
- Georgina from Lookahead

#### Sublime Text

Sublime Text is a very powerful application, but in order to take full advantage of it we use a thing called Package Control. Firstly we need to install it!

If you are using Sublime Text 3, copy this code...

```
import urllib.request,os,hashlib; h = 'eb2297e1a458f27d836c04bb0cbaf282' + 'd0e7a3098092775ccb37ca9d6b2e4b7d'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
```

Or if you are using Sublime Text 2, copy this code...

```
import urllib2,os,hashlib; h = 'eb2297e1a458f27d836c04bb0cbaf282' + 'd0e7a3098092775ccb37ca9d6b2e4b7d'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); os.makedirs( ipp ) if not os.path.exists(ipp) else None; urllib2.install_opener( urllib2.build_opener( urllib2.ProxyHandler()) ); by = urllib2.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); open( os.path.join( ipp, pf), 'wb' ).write(by) if dh == h else None; print('Error validating download (got %s instead of %s), please try manual install' % (dh, h) if dh != h else 'Please restart Sublime Text to finish installation')
```

Once you have copied the code, open up the Sublime Text console.  ` View > Show Console `. Once that is opened, paste the code you copied into the text box down the bottom.

Wait a little while, and it should say a success message or say that a missing dependency was installed. When this happens, hit enter, then restart Sublime Text (as in, quit the application).

To check that it works - click Sublime Text > Preferences and if Package Control is visible, you are all sorted.

The first package that we need is called "Emmet", it should mention Ex-zen coding.  To install a package...

Sublime Text > Preferences > Package Control > Install Package and then type Emmet.  Hit enter when you find the right package.  It will give you a successful message and show you a bit of documentation about Emmet. Restart Sublime Text!

Emmet is really helpful when writing HTML, it automates a lot of stuff for us.  Check out [here](http://docs.emmet.io/cheat-sheet/) and [here](http://docs.emmet.io/abbreviations/syntax/).  They will give you lots of information about how to use Emmet.

###### Brief Intro to Emmet

Everything with Emmet comes from writing down a shortcut and then hitting tab at the end of the shortcut.

_Tag Name_

Whether it is a ` p `, a ` div `, or anything else. If you type the tag name, and then hit tab, it will create the element.

_Classes and IDs ( # or . )_

```
div.className
Makes <div class="className"></div>

div#tagName
Makes <div id="tagName"></div>

div.firstClassName.secondClassName
Makes <div class="firstClassName secondClassName"></div>

div.className#secondClassName
Makes <div class="className" id="secondClassName"></div>
```

_Children ( > )_

This is for nesting elements!

```
div>p
Makes <div><p></p></div>

header>nav>p
Makes <header><nav><p></p></nav></header>
```

_Sibling ( + )_

This is for creating elements next to each other.

```
header+div.container
Makes <header></header><div class="container"></div>
```

_Multiplication ( * )_

This is for making multiple elements at once.

```
div>ul>li*3
Makes <div>
    <ul>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</div>
```

_Climb Up ( ^ )_

This is to climb out of a nesting.

```
header>p^div
Makes <header>
    <p></p>
</header>
<div></div>
```

_Grouping ( () )_

This is to group chunks of elements so you don't need to worry about climbing.

```
(header>h1)+(nav>a)
Makes <header>
    <h1></h1>
</header>
<nav><a href=""></a></nav>
```

_Attributes ( [] )_

This is to give custom attributes.

```
img[src="" title="" alt=""]
Makes <img src="" alt="" title="">
```

_Text ( {} )_

This is to add text to things.

```
a{This is a link to something}
Makes <a href="">This is a link to something</a>
```

These things can all be used together!

#### Sublime Text Shortcuts

_Display_

- <CMND> + <OPT> + 1   - Single column
- <CMND> + <OPT> + 2   - Two columns
- <CMND> + <OPT> + 3   - Three columns
- <CMND> + <OPT> + 4   - Four columns
- <CMND> + <OPT> + 5   - A grid of 4
- <CMND> + <SHIFT> + <OPTION> + 2   - Two rows
- <CMND> + <SHIFT> + <OPTION> + 3   - Three rows

_Efficiency_

- <CMND> + Click - Multiple Cursors
- <CMND> + D - Selects the current word or the next instance of the current word
- <CMND> + <CONTROL> + G - All of the same word
- <CMND> + [ - Indent to the left
- <CMND> + ] - Indent to the right
- <CMND> + <SHIFT> + L - Puts a cursor at the end of the line for entire selection
- <CMND> + Right - Go to the end of the line
- <CMND> + Left - Go to the start of the line
- <OPTION> + Click and Drag - Select in a different way

#### Wireframing

- [Bohemian Coding's Sketch](http://bohemiancoding.com/sketch/) - my favourite
    + Great tutorial [here](https://designcode.io/sketch)
- [Axure RP Pro](http://www.axure.com/)
- [Balsamiq](https://balsamiq.com/)
- [Wireframe.cc](https://wireframe.cc/) - very light wait
- Adobe Suite, normally Photoshop or Indesign
- Pen and Paper (or whiteboard marker and whiteboard)

#### Sublime Text Packages

Go [here!](../useful/st_packages.md)

#### Display

Every element on a page is a rectangular box (this is called the box-model). The display property is the thing that determines how that box behaves.  There are a bunch of things that can be given to it, but the main ones are:

**_Inline_**

An inline element will accept margin and padding, but the element still sits inline as you might expect. Margin and padding will only push other elements horizontally away, not vertically.  Inline elements will allow things to sit next to them and is the default value for some elements (em, span, and b).

An inline element will not accept height and width. It will just ignore it.

**_Inline Block_**

An element set to inline-block is very similar to inline in that it will set inline with the natural flow of text (on the "baseline"). The difference is that you are able to set a width and height which will be respected.

**_Block_**

A number of elements are set to block by the browser UA stylesheet. They are usually container elements, like <div>, <section>, and <ul>. Also text "blocks" like <p> and <h1>. Block level elements do not sit inline but break past them. By default (without setting a width) they take up as much horizontal space as they can.

Things won't sit next to block-level elements!

**_None_**

Totally removes the element from the page. Note that while the element is still in the DOM, it is removed visually and any other conceivable way (you can't tab to it or its children, it is ignored by screen readers, etc).

#### Positioning

Originally designed for scripting animation effects, this is not designed for layouts (but it is very possible!) - stick to display for that.

There are a bunch of different values for this, these are the most common ways:

**_Static_**

Static is the default value.  It lets the element use the normal behaviour (what it is supposed to do).  The top, right, bottom, left and z-index properties do not apply. It really does nothing.

**_Relative_**

It treats position: static as its starting point and, without changing any other elements position, allows us to move it around based on its static position.

For example, if we added top: -20px to an element, it would move that element up the page by 20px.

**_Absolute_**

Position absolute is very different to relative and static.  If we add this property, the browser will not leave space for that element.  Instead it references its nearest positioned parent ( non-static ) - this will often reference the body element.

Make sure you reference top and left or bottom and right when you use this property.  Remember that this will change the document flow!

**_Fixed_**

This is quite similar to position absolute.  You reference the top, bottom, left and right - except it sticks to the place that you tell it.

This is how they create fixed navigation bars etc.  Remember that it references its nearest positioned element!

```css
nav {
    position: fixed;
    top: 0;
    left: 0;
    height: 80px;
}
```

Get to know this stuff!  And, go [here](https://developer.mozilla.org/en-US/docs/Web/CSS/position) for more information.

#### Google Fonts

- Go through [here](https://www.google.com/fonts) and Add the fonts that you want to your Collection
- Once you have selected all your fonts, click Use (bottom right)
- Choose the styles that you would like, and the character set
- Choose @import, and copy and paste the code into the top of your CSS file that it shows
- Reference the font with the code provided

#### Font Awesome

- Go [here](http://fortawesome.github.io/Font-Awesome/get-started/) and copy the CDN link - `<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">`
- If you aren't using a server (Node or Ruby or anything else), add https at the front of the href
- Put this in the head of your HTML page
- Go through [here](http://fortawesome.github.io/Font-Awesome/icons/) and click on the icons that you want
- That will show you the HTML that you need

#### Custom Fonts

To reference custom fonts, you need to have the fonts saved in your project.  Reference them in this way - make sure this is at the top of the CSS file!  Reference this particular font by using the font-family name you referred to.

```css
@font-face {
  font-family: 'GT Pressura';
  src:  url('GTPresurra.eot');
  src:  local('GT Pressura'),
        url('GTPressura.eot#iefix'),
        url('GTPressura.eot') format("truetype"),
        url("GTPressura.otf") format("opentype"),
        url("GTPressura.woff") format("woff"),
        url("GTPressura.woff2") format("woff2"),
        url("GTPressura.svg") format("svg");
}
```

To convert fonts, use [this tool.](http://onlinefontconverter.com/)

#### Fontello

This will generate a custom font for you, that you will then need to reference in your CSS.  Once you have selected all the icons that you want, give it a family name (top right) and select download webfont.  Make sure you have all the formats that you need (from the custom fonts section above), and reference each icon with the code that it gives you.

#### Variadic Attributes (margin etc.)

Variadic attributes are just shorthands to apply a number of properties.  Take margin for example:

```css
h1 {
    /* Applies to all four sides */
    margin: 1em;

    /* vertical | horizontal */
    margin: 5% auto;

    /* top | horizontal | bottom */
    margin: 1em auto 2em;

    /* top | right | bottom | left */
    margin: 2px 1em 0 auto;
}
```

#### [Homework](https://gist.github.com/wofockham/47097f750914f9f23644)