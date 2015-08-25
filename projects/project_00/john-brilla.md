# John - Tic Tac Toe Project Feedback

Brilliant job on this, John!!  For a first project, this looked great and worked really well. You should be very happy with it. But I can't spend the whole time complimenting you, so let's have a look at your code!

## HTML

Your HTML is clean and well-indented.  My only comments would be:

- Make sure all text on the page is contained within a textual element (h1 - h6, p, a etc.). There are a couple of times when you have used div tags to containing text.  Line 57's text for example should be in a paragraph tag (or something along those lines)
- Line 31 should be expanded out a bit and indented a bit but that isn't a biggie.
- There are a bunch of stray closing </td> tags (line 37, 38, 41, 42, 43, 46, 47, 48) so worth removing them

But very nice!

## CSS

Very nice again, but a couple of comments:

- When applying backgrounds to the body, make sure you add background-size: cover; unless you want the images to repeat.
- There is a far bit of reliance on position absolute and lots of margin stuff here. Definitely better to use floats or display: inline-block to allow for things sitting next to each other

Really clean.

## JS

Really well structured again, Aili!

A couple of comments:

- Instead of having random colours in your Javascript, it is best to keep things that are style-related in the CSS - and just add and remove classes with JS.
- In the same way, best to do things like hovers with CSS. You can still have the function that does the shake in a javacript function, but for the changes in background colours. Use classes or pure CSS.
- Instead of refreshing the page, it is best to have clearBoard doing all of that work. (i.e. changing all the counters back to 0 etc.)


Really great code though, Aili.  Very impressed!  Make sure you come and grab me if you want to have a chat about anything - always happy to help!