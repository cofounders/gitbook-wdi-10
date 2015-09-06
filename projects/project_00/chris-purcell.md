# Chris - Tic Tac Toe Project Feedback

You did a really great job on this mate. For a first project, it looked great and worked really well. The AI was amazing. You should be stoked!  But I can't spend the whole time complimenting you, so let's have a look at your code.

## HTML

Your HTML is clean and mostly well-indented (there are a few issues - like nothing being indented in the gameBoard.

- Tables are a nightmare (as you probably know now), genuinely they are avoided but it is cool that you got them working
- ` <h3 class="currentPlayer">You are playing as:</h3> ` would be better written as ` <h3 class="currentPlayer">You are playing as: <span></span></h3> `.  By having that span tag, when you are mucking around with the text with js, you only need to change the spans text. It also means that you only have to change the text in one place for "You are playing as:".  There are a couple of places where having a span element would have helped

Nice though.

## CSS

Very nice again, but a couple of comments:

- When using assets like background - best to have them seperate in an images folder (or just call the folder assets)
- If you are going to use new units such as RGBA, make sure you provide a fallback so that it works in older browsers
- There is a little bit of duplication- think .play, .playertwo and .reset. You could apply the widths and heights on all of them at once - then just have the left attribute different on each one.
- Try to avoid relying too heavily upon position absolute - it makes it hard for responsive stuff

There is some really nice CSS in here though, well done.

## JS

Your javascript is really nice, Chris. Remember to really focus on indentation though.

- I like how you broken everything down into an object, though you don't need to add the $ sign at the start of ticTacToe.  You tend to add the $ sign only if it is a jQuery selected element
- The functions that return the text of all the boxes is cool, though it might be best to just have a function that receives a number which then finds the text of an element - that way you won't need nine of them
- Remember that the $() is just a CSS selector, this means that you can select multiple elements in one go - that would help a couple of places where code is duplicated
- Lots and lots of if statements, I reckon you could sort it out with some for loops that may help this stuff out.  But it shows that you really thought about it so it's really good.


Really great code, Chris.  I'm very impressed!  Make sure you come and grab me if you want to have a chat about anything - always happy to help!