# Robinson - Tic Tac Toe Project Feedback

Your project was really, really good, Robinson. Your code is outrageously nice, well-indented and shows that you really understand everything we have been trying to get across.  Anyway, here are some comments:

## HTML

Your HTML is really clean, well-indented and there aren't any validation errors (this is how I check it for errors - https://validator.w3.org/nu/#textarea). Though there are some weird closing tags - see line 22 to 31 - which are worth sorting out.

## CSS

Very nice again, but a couple of comments:

- Good work with the animations, they require the browser prefixes though - see here https://css-tricks.com/snippets/css/keyframe-animation-syntax/
- Really modern things like box-sizing border-box always need to be browser prefixed as well
- When using units that don't work in many browsers, make sure you provide a fallback so that it will still work

Your CSS is very nice, and again, there are no validation errors! (https://jigsaw.w3.org/css-validator/#validate_by_input)

## JS

Your Javascript code is beautiful. Really nice and clean.

- Instead of doing something like this - ` $($box[4]) ` - it is much better practice to do this - ` $(box).el(4) `.
- Lots of complicated maths in here, well worth documenting some of that stuff!
- When you create elements with jQuery, there is no need to add the closing tag - ` $("<li></li>") ` to ` $("<li>") `


This is incredible though, Robinson. I can't tell you how impressed I am.