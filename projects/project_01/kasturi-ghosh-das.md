# Kasturi - Great Reads - Project 01 Feedback

Hi Kasturi! You did a really great job on this project.  It looks good and works really well. It seems like you are really getting the whole Rails thing. Really great work with all of it. But I better start looking through all of the code!

_Readme_

Readmes are really important.  Not just for you but also for potential employers etc.  Try not to make them to code-focussed - more about what the application is about, the technologies that are used, setup instructions, point out existing bugs and features that you want to add next.  Think about as if you had to explain an entire application without showing a single line of code for the moment.  [This](http://stackoverflow.com/questions/2304863/how-to-write-a-good-readme#answers) isn't a bad description of what should go in there.

Also, it is pretty much always written in markdown, so that's probably the file type you want (it's normally called README.md).

_Gemfile_

Some nice Gems in here!

_App/Assets_

JS...

The javascript stuff here is really nice! Good, clean code. Though we can use some weird CSS selectors to get that work done for us!

```js
$("a[href=' + currentURL + ']").parents("li").addClass('active');
```

That should do the same as all that each loop stuff! CSS selectors are very powerful!

CSS...

Your CSS is very good, Kasturi.  But a few comments!

- When referencing images on a URL, never add the protocol (the http: or https:) because that forces the image to be loaded either securely or non-securely. If you don't have a protocol, it just uses whatever is appropriate. Also, remember that that image could be taken down! So normally better to save it.
- Lots of pixel values, remember that this makes it harder for responsive stuff - I tend to use either percentages, ems or rems, it makes things a lot easier
- Remember that newer CSS properties (transition, opacity and box-shadow for example) need to be browser-prefixed so that they work in older browsers. Along those lines, RGBA colors only work in newer browsers so always provide a fallback color.

_Controllers_

Really great use of before_actions Kasturi. That is a great way to have code running all of the time without being explicit about, and good to see that you are adding lots of methods into the private section!  It's also good to see that you are using the application controller a little bit, that is really helpful for having useful methods.  Good use of whitelisting params as well.

One small comment though...

```rb
@current_user = User.find_by :id => session[:user_id]
# Could be rewritten as...
@current_user = User.find session["user_id"]
# You only need to use find_by if you are searching with an attribute other than an ID
```

_Books Controller_

I would like to see the create method have most of its functionality in private methods as well. In an ideal world, the main CRUD actions in a controller are only a couple of lines long and only serve to call a bunch of methods.  All of the code in here is very nice though.

All of your controllers are amazing, Kasturi!

_Models_

Associations?

Really nice clean associations, it definitely seems like you planned this project really well!  I would like to have seen a few more validations about what data is getting saved, validation is very important (particularly when you are dealing with uses) so don't trust what is getting given to you!

I love the fact that you have got all these custom methods in here, they are really good! Great work using enum as well!

_Views_

Your HTML is nice and clean and the indentation is mostly very good - make sure you indent when you are within an each loop!  Try to avoid using br tags as they are hard to style - try and stick to using paddings and margins - you have a lot more control!

Try and keep the amount of code in the application.html.erb to a minimum - remember that you can use partials in there as well! It would be good in here to have a nav partial.  But this is all very good!

_Config_

Really nice clean routes.

_DB_

I mentioned it before, but it is really obvious that you planned this out well. You had lots of things going on (lots of models) and lots of attributes and you did a great job of it.  Looking at the schema, everything is modelled correctly and the migrations are nice and clean as well.



All in all Kasturi, you did a brilliant job on this. Your code is clean, readable and well-formatted and you accomplished a lot in a short period of time. Really well done!