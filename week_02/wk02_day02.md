## Week 02, Day 02.
### 11 / 08 / 2015

What we covered today:
- [Warmup Exercise](https://gist.github.com/avenoir/7abc8be8bcc377816691)
    + [Solution](https://github.com/avenoir/WDI10-Homework/tree/master/warmup-exercises/week_02/nucleotide)
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