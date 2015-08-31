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

- When specifying widths, it is best to specify a max-width (this means that it is a little easier to make responsive and will respond to the size of the screen)

There is some really nice CSS in here, well done.

## JS

This is outrageous, your javascript is very impressive. Had you done a bit of coding before this course? It's very nice.

- Remember you never need to compare to true when using if statements, as if it is truthy, it will cause that anyway. (line 106 for example)
- Instead of changing .attr("class"), the easiest way is to use addClass and removeClass. That way if you have some other classes going on, it won't stuff you up.  210 - 218 for example


Really great code though, John.  Very impressed!  Make sure you come and grab me if you want to have a chat about anything - always happy to help!