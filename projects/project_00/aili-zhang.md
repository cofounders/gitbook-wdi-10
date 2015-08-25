# Aili - Tic Tac Toe Project Feedback

Brilliant job on this, Aili!!  For a first project, this looked great and worked really well. You should be very happy with it. But I can't spend the whole time complimenting you, so let's have a look at your code!

## HTML

Your HTML is clean and well-indented.  My only comments would be:

- Make sure you reference custom (google) fonts above the reference to your stylesheet (style.css)
- I try to avoid things like tables! They are only really used in email design (because they are the only thing that works here). I much prefer using divs that are floated or have display inline-block. If I don't care about browser support, I would use flexbox
- I also try and stick to classes as much as possible. I try and pretend that ids don't really exist.

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