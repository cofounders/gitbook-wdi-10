# Tamara - Project 01 Feedback

You did a really good job on this Tamara. It was so cool seeing how much you got through. Coding is such a foreign thing at the start but it really does seem like it is starting to glue! The code that you wrote for this is very nice and clean.  Anyway, I better have a look through it again and start the commenting!  Really, well done again though.

_Readme_

Quite a good Readme, though remember that everyone tends to write their READMEs in markdown - it's normally called README.md.  Try not to make it to code-focussed preferring to talk about what problem you were trying to solve, how you ended up solving it, any bugs that you know about, local setup instructions and what you will work on next with it. But this is quite good!

_App/Assets_

CSS...

Your CSS is very good but a few comments:
- Make sure that when you are using custom fonts you put quotes around them
- When positioning elements, if you are moving an element around by 100s of pixels, it's probably worth using position absolute
- If you need to browser prefix things (like transitions for example), make sure that the browser prefixed versions come first as they will overwrite the non-browser prefixed versions if they come later

_Controllers_

Again, really nice work with all of this stuff, but a couple of comments:
- To order things in reverse, there are a bunch of ways, and reverse_order is quite a good way but worth checking this out...  It should do the same thing
  ```ruby
  @posts = Post.order( :created_at ).reverse_order
  @posts = Post.order( created_at: :desc )
  ```
- Really nice to see you using the _params methods, they are very good.
- You probably don't need to tell it to render :like, that should happen naturally because that is the method that was callled

Good work though.

_Models_

Nice clean associations and some pretty good validations as well! All looking good here!

_Views_

All very clean.  There isn't much I can comment on actually! Be careful with your indentation but it is very good in here

_Config_

Nice, clean routes.

_DB_

And good looking database. I like the way that you have used all of these default values! Definitely seems like you thought this one through!



I'm really impressed with all of this Tamara. All of your code is so nice and readable!  Really great work.