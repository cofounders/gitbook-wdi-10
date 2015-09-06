# Will - Tic Tac Toe Project Feedback

Brilliant job on this, Will!!  For a first project, this looked great and worked really well. You should be very happy with it. But I can't spend the whole time complimenting you, so let's have a look at your code!

## HTML

Your HTML is clean and mostly well-indented.  There aren't even any validation issues with it - it's absolutely perfect haha.  Occasionally you indent a bit too far but it is okay.

## CSS

Very nice again, but a couple of comments:

- When specifying heights and widths using modern units such as vh, be sure to always provide a fallback so that it will work in older browsers
- Try to avoid relying too heavily upon position absolute. It makes it really hard to make responsive.  Instead try and break your design into columns and work it out that way.
- I think when you said hidden true on line 74, you meant visibility: hidden. That should get the job down there - it does roughly the same thing as opacity 0
- For browser compatibility as well, worth providing fallbacks for colours such as rgba
- -webkit-filter none is really nice, but make sure you provide the non-browser-prefixed version (filter none)

There is some really nice CSS in here, well done.

## JS

Your javascript is very, very nice mate. Really well done with it all!

- I really like how you have your winning combinations and then broken them down into first row etc.
- Try and avoid adding and removing styles in your javascript - it is much better to add and remove classes with javascript (also much more efficient)
- I really like how you are using the .detach() method, but if you are just trying to remove the element, just use .remove(). Behind the scenes, detach keeps a lot of things in memory that it doesn't need to
- Lots of loops within loops, in an ideal world, there would be a way to avoid that


Really great code though, Will.  Very impressed!  Make sure you come and grab me if you want to have a chat about anything - always happy to help!