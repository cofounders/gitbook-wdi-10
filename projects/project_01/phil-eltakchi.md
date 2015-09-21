# Phil - Project 01 Feedback

You did a brilliant job on this mate. It was so cool seeing how much you were getting through and how much you were enjoying it. And it worked exactly how you wanted it to!  Perfect result.  Really well done with it all, and now I will have a look at some of the code!

_Readme_

Quite a good Readme, though remember that everyone tends to write their READMEs in markdown - it's normally called README.md.  Try not to make it to code-focussed preferring to talk about what problem you were trying to solve, how you ended up solving it, any bugs that you know about, local setup instructions and what you will work on next with it. But this is quite good!

_App/Assets_

CSS...

Really clean CSS, and you used gainsboro!  That is great.

_Controllers_

Nice work with all of this stuff, but a couple of comments:

- Make sure you focus on the naming of variables, that big chunk of code (@players_ordered, @players_ordered2 ... etc.) will become harder to read further down the track
- Great use of whitelisting params
- Remember that you only need to declare instance variables if you are trying to use the data within that variable in a view. All other times you won't need it so best to just use local variables
- Try not to add too much code in the CRUD methods, put all of the hardcore functionality in private methods at the bottom of the controller (the create method in the games controller is a good example of this)

Great stuff though, there was a crazy amount of stuff you had to learn for this and you nailed it!

_Models_

Nice clean associations and some pretty good validations as well! All looking good here!  Though, when you are trusting the user to create things, make sure you try and validate everything!

_Views_

All very clean.  But a few comments again:

- Really focus on your indentation, the new games for example (though that form is brilliant, nice work getting the selects up and running)
- In the same way that we can use partials to have reusable code, they a are good way to keep things seperate. Take the application.html.erb file for example, it wouldn't be a bad idea to have the navigation menu stored in a nav partial
- Great stuff with the tables and good use of view helpers

_Config_

Nice, clean routes.

_DB_

And good looking database. I like the way that you have used all of these default values! Definitely seems like you thought this one through!



Really impressive work mate, you got through so much stuff and had to learn a lot of things in the process. I'd be stoked if I were you! Really well done