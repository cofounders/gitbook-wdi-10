# Will - Project 01 Feedback

Hey Will. You did a greatjob on this project!  It looks good and works really well. There were so many moving parts in this so you should be really proud of yourself for getting it done.  But enough of the compliments, time to get on to the code!

_Readme_

This is a decent readme.  Try not to make them to code-focussed - more about what the application is about, the technologies that are used, point out existing bugs and features that you want to add next.  Think about as if you had to explain an entire application without showing a single line of code for the moment.  [This](http://stackoverflow.com/questions/2304863/how-to-write-a-good-readme#answers) isn't a bad description of what should go in there.  But at least you have a bit of stuff in there! Make sure you delete the README.rdoc file, as that might conflict with the README.md file.

_Gemfile_

Some really cool Gems in here, well done on getting some of them up and running!

_App/Assets_

CSS...

Great CSS! But a couple of comments:
- No need to add http: or https: at the start of your font import. You want the browser to decide whether it wants to be secured or not
- If you are using newer properties such as vw or vh for example, be sure to provide a fallback as they will not work in older browsers (and remember that rgb exists if you don't need transparency)
- Along the same line, be sure to vendor prefix things like transition
- I try to avoid flexbox just because it doesn't work in many browsers, but nice usage of it

_Controllers_

This is all spot on!  Very good code.

- If you are performing a method over a couple of lines, make sure you always use the do ... end version
- In the def create of the letters controller (same with the update), it's probably best to not do multiple saves
- Instead of constantly assigning @user to be equal to @current_user, it's probably best to just use @current_user in the views

Really nice stuff, though.

_Mailers_

Really great work on getting the mailers up and running!  All looks good in here.

_Models_

- Really good associations in here, nothing to complain about at all!
- Nice work on the validations as well, though I would like to see a few more testing more than just their presence - like the structure or format for example

_Views_

- Nice, cleanly indented code. Well done with all of this!
- I try and keep my application.html.erb as empty as possible, preferring to keep all the pieces in partials (like a nav partial for example)
- Great work with all of the forms
- Good use of Cloudinary

_Config_

Nice clean routes.

_DB_

Really solid seeds file, nice migrations, and a well thought out schema.

_Other_

Cool to see the custom Procfiles and the custom initializers.


You have done a brilliant job on all of this Will. Great stuff! Looking forward to seeing what you build next.