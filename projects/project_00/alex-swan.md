# Alex - Tic Tac Toe Project Feedback

Your project was out of this world, Alex. I wasn't kidding when I said that I think this is the best first project I have ever seen. Your code is outrageously nice, well-indented and shows that you really understand everything we have been trying to get across.  Anyway, here are some comments:

## HTML

Your HTML is really clean, well-indented and there aren't any validation errors (this is how I check it for errors - https://validator.w3.org/nu/#textarea).  You should make sure you add links to your github and repo though.

## CSS

Very nice again, but a couple of comments:

- When using really modern values such as vw and vh, be sure to always provide a fallback (like a pixel value), just in case it doesn't work.
- Instead of loading a big image like you have with yellow.jpg, you could either make a much smaller image or you could replicate that image with gradients (something like this could help - http://www.gradient-animator.com/).
- Try not to rely too heavily upon position absolute
- Remember that you can comma seperate selectors to reduce duplication
- Amazing work with the animations, they require the browser prefixes though - see here https://css-tricks.com/snippets/css/keyframe-animation-syntax/

Your CSS is very nice, and again, there are no validation errors! (https://jigsaw.w3.org/css-validator/#validate_by_input)

## JS

Your Javascript code is beautiful. Really nice and clean.

- At the start of the game, the scores are getting assigned to null and then shown on the page as null - best to sort that out
- You could rewrite things like ` if (Game.bey === true && Game.tay === false) ` like ` if ( Game.bey && !Game.tay ) ` would work
- You should only be using things like .find() when referencing the children of "this". Otherwise it just makes multiple queries
- Remember that you don't always need to return something - it's only useful when you are chaining functions or storing the result of a function in a variable (think line 350)


This is so incredible Alex. I can't tell you how impressed I am.