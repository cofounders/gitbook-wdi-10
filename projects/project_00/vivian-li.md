# Vivian - Tic Tac Toe Project Feedback

Brilliant job on this, Vivian!!  For a first project, this looked great and worked really well. You should be very happy with it. But I can't spend the whole time complimenting you, so let's have a look at your code!

## HTML

Your HTML is clean and mostly well-indented.  The odd indentation issue and there is a stray end head tag on line 10.

## CSS

Very nice again, but a couple of comments:

- A few indentation issues again
- Remember that you can select multiple things with CSS by seperating things with commas
- An extra semicolon on line 69
- Remember that it is display: inline-block, not display line-block
- Try to not rely too heavily upon position absolute, it makes it very hard to make responsive

There is some really nice CSS in here though, well done.

## JS

Your javascript is really nice, Vivian. Remember to really focus on indentation though.

- A bunch of missing semicolons so worth going through and figuring them out. Tools such as jshint might help
- When using the unbind function, you don't need to pass in a function. It's only if you are being really specific - I just tend to use it like ` $("#someElement").unbind() ` or ` $("#someElement").unbind( "click" ) `.  That way if functions change or anything like that, it is never an issue
- You can remove a bunch of elements at once rather than one at a time. Comma seperate them!
- Try to avoid styling things with javascript, just add and remove classes with it
- I really like your win conditions!


Really great code though, Vivian.  I'm very impressed!  Make sure you come and grab me if you want to have a chat about anything - always happy to help!