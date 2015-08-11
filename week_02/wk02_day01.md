## Week 02, Day 01.
### 10 / 08 / 2015

What we covered today:
- Warmup
- MTA Demos
- HTML
- CSS
- Daisy Smith from WDi5!
  + [The Slides](https://slack-files.com/files-pri-safe/T0351JZQ0-F08T8RK7B/front-end-talk.pdf?c=1439268122-61ef5a619bb6f176c2277eb27303fc63b158272b)

#### Warmup

[Scrabble Documented Solution and Readme's](https://github.com/avenoir/WDI10-Homework/tree/master/warmup-exercises/week_02/scrabble)

#### HTML

- [The First Website Ever](http://info.cern.ch/hypertext/WWW/)
- [The History of Web Design](http://www.americommerce.com/blog/The-History-of-Web-Design-Infographic)
- [A much nicer view of the History of the Web](http://www.evolutionoftheweb.com/)

**What is HTML?**

- Stands for Hyper Text Markup Language
- Currently at Version 5 (as of October 2014)
- Made up of tags (opening and closing usually), which in turn create elements

```html
<!--    This whole thing is an element      -->
<tagname attribute="attribute_value"></tagname>

<!-- A paragraph tag with two classes, could be selected in CSS using p.default-paragraph.another-class {} -->
<p class="default-paragraph another-class">Some content in here</p>
```

**What does an HTML document need?**

```html
<!doctype html> <!-- Always have this - it describes which version of HTML you are using -->
<html>
    <head></head> <!-- This is the meta data of the page, often invisible -->

    <body></body> <!-- This is where the actual content is -->
</html>
```

**Common Elements**

*Actual Content*

```html
<!-- Heading Tags - getting less important the higher the number -->
<h1></h1>
<h2></h2>
<h3></h3>
<h4></h4>
<h5></h5>
<h6></h6>

<p></p> <!-- A paragraph tag -->

<!-- An HTML element can have attributes.  Attributes are key value pairs (just like javascript objects) that provide additional information. They look like this. This is a link by the way (or anchor tag) -->
<a href="generalassemb.ly">General Assembly</a>

<img src="" />
<video src=""></video>

<br /> <!-- a new line -->
<hr /> <!-- a horizontal line -->

<button></button>
<input />

<pre></pre> <!-- Preformatted text -->
<code></code>

<textarea></textarea>

<ul> <!-- Unordered list -->
    <li></li> <!-- List item -->
</ul>

<ol> <!-- Ordered list -->
    <li></li>
</ol>
```

*Dividing Content*

```html
<div></div> <!-- A division, this is just a way to group content -->
<section></section>
<header></header>
<main></main>
<nav></nav>
<!-- etc. -->
```

For more information, see [here.](https://developer.mozilla.org/en/docs/Web/HTML/Element)

*Placeholder Stuff*

TEXT:
- [Meet the Ipsums](http://meettheipsums.com/)
- [Monocle Ipsum](http://www.monocleipsum.com/?paras=5&type=business-class&start-with-lorem=1)
- [Samuel L. Jackson Ipsum](http://slipsum.com/)
- [Wiki Ipsum](http://www.wikipsum.com/)
- [Social Ipsum](http://socialgoodipsum.com/#!/#top)
- [56 Other ones](http://mashable.com/2013/07/11/lorem-ipsum/)

IMAGES:
- [Placeholdit](http://placehold.it/)
- [Place Bear](http://placebear.com/)
- [Dummy Image](http://dummyimage.com/)
- [Place Kitten](https://placekitten.com/)
- [Fill Murray](http://www.fillmurray.com/)
- [Nice Nice JPG - Vanilla Ice](http://www.nicenicejpg.com/)
- [Place Cage](http://www.placecage.com/)

#### CSS

**What is CSS?**

- Stands for cascading style sheets
- It defines how HTML elements are to be represented
- Styles were added to HTML 4
- Currently at version 3 (CSS3)

```css

selector {
    /* A Declaration */
    property:    value;
}

p {
    color: red;
}
```

**CSS Selectors**

Here are the basics of CSS Selectors, for more - go [here.](http://flukeout.github.io/)

```css
p {} /* Selects all paragraph tags */

p.octocat {} /* Selects all paragraph tags with the class octocat */

.octocat {} /* Selects any tag with the class octocat */

p#octocat {} /* Selects any paragraph tag with the ID octocat */

#octocat {} /* Selects any element with the ID octocat */

* {} /* Selects all elements */

div p {} /* Selects all paragraph tags that are within div tags */

p, a {} /* Selects all p tags and all a tags */

p:hover {} /* Selects all p tags when they are hovered over */
```

**CSS Specificity**

Due to CSS's cascading nature, CSS rules will be overwritten.  You need to have a bit of a handle on this.

- 1 point for an elements name
- 10 points for a selection based on a class
- 50 points for a selection based on an ID

For more details:
- [Smashing Magazine - CSS Specificity](http://www.smashingmagazine.com/2007/07/27/css-specificity-things-you-should-know/)
- [CSS-Tricks - Specifics on CSS Specificity](https://css-tricks.com/specifics-on-css-specificity/)

[This](http://flukeout.github.io/) is a great way to learn selectors.

**Floats and Clears**

I'm not going to go into this that much - but these two articles will help explain this.  For the most part - avoid floats and clears, stick to display: inline-block or inline instead.  Only in the case that you need text to wrap around images should this be used.

- [CSS Tricks - All About Floats](https://css-tricks.com/all-about-floats/)
- [Smashing Magazine's The Mystery of Floats](http://www.smashingmagazine.com/2009/10/19/the-mystery-of-css-float-property/)


#### Homework

*Hell is other people's HTML*

- Understand: [Separation of Concerns](http://en.wikipedia.org/wiki/Separation_of_concerns)
- Play: [CSS Diner](http://flukeout.github.io/)
- Read: [Learn Layout](http://learnlayout.com/)
- Memorise: [30 CSS Selectors](http://code.tutsplus.com/tutorials/the-30-css-selectors-you-must-memorize--net-16048)
- Work through: [Discover Dev Tools](http://discover-devtools.codeschool.com/) - Chapters 1 and 2
- Complete: [Brook & Lyn](https://ga-students.slack.com/files/joel.turnbull/F04MMDPH9/brooklyn.zip)
- Complete: [Busy Hands](https://ga-students.slack.com/?redir=%2Ffiles%2Fjoel.turnbull%2FF04MMDSU9%2Fbusyhands.zip)
- Complete: [eCardly, both versions](https://ga-students.slack.com/?redir=%2Ffiles%2Fjoel.turnbull%2FF04M02XPY%2Fecardly.zip)



