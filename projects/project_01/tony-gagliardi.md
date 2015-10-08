# Tony - Project 01 Feedback

Hey Tony. You did a really good job on this project mate.  It looks amazing and works really well. You also seemed to get everything done that you wanted to, so that is great. But enough of the compliments, time to get on to the code!

_Readme_

Readmes are really important.  Not just for you but also for potential employers etc.  Try not to make them to code-focussed - more about what the application is about, the technologies that are used, setup instructions, point out existing bugs and features that you want to add next.  Think about as if you had to explain an entire application without showing a single line of code for the moment.  [This](http://stackoverflow.com/questions/2304863/how-to-write-a-good-readme#answers) isn't a bad description of what should go in there.

_Gemfile_

Some cool Gems in here, well done on getting some of them up and running!

_App/Assets_

JS...

Really nice clean Javascript. Because you have jQuery in it, you may as well use that (change the document.getElementsByClassName("map-canvas")[0] to $(".map-canvas")[0] for example).  But this is all nice. It would be cool to see AJAX involved with this to change the markers on the map!

CSS...

Great CSS! But a couple of comments:
- No need to add http: or https: at the start of your font import. You want the browser to decide whether it wants to be secured or not
- Good work on getting the Clean Blog stuff up and running
- Always best to use ems or percentages as pixels can be hard to make responsive

This stuff is nice though.

_Controllers_

This is all spot on!  Great work on getting Cloudinary up and running. I really liked how you checked whether the user was valid before uploading it.  Remember that there is no need to say @user = @current_user because that means they are the same thing. You can always say @current_user.update for example (line 34 of users_controller).  Great use of the fetch_current_user function as well!

_Models_

Very good associations in these models, exactly what you need!  I would like to have seen a few more validations but this is all good.

_Views_

- Great work with the random user order
- Remember to leave the http: and the https: off the links and scripts as that will mean the browser can determine whether it wants the secured or unsecured versions
- Would be cool to see all the navigation stuff put in a partial
- Great use of Bootstrap
- Well-indented and good use of ERB

_Config_

Nice clean routes.

_DB_

You should always try and have a few things in the Seeds file, that can really help someone who wants to see the project out, it also helps for the development.  Nice migrations, and good schema.


You have done a really good job on all of this though Tony. Great stuff! Looking forward to seeing what you build next.