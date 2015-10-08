# John - Project 01 Feedback

Hey John. You did a really good job on this project mate.  It looks amazing and works really well. You also seemed to get everything done that you wanted to, so that is great. But enough of the compliments, time to get on to the code!

_Readme_

Readmes are really important.  Not just for you but also for potential employers etc.  Try not to make them to code-focussed - more about what the application is about, the technologies that are used, setup instructions, point out existing bugs and features that you want to add next.  Think about as if you had to explain an entire application without showing a single line of code for the moment.  [This](http://stackoverflow.com/questions/2304863/how-to-write-a-good-readme#answers) isn't a bad description of what should go in there.  But at least you have a bit of stuff in there! Make sure you delete the README.rdoc file, as that might conflict with the README.md file.

_Gemfile_

Some cool Gems in here, well done on getting some of them up and running!

_App/Assets_

JS...

Really nice clean Javascript.

- Remember you can pass an object into the .css function
  ```
  $('img').css('border-radius', '20px');
  $('img').css('margin-left', 'auto');
  $('img').css('margin-right', 'auto');
  $('img').css('margin-top', 'auto');
  $('img').css('margin-bottom', 'auto');

  // Could be written as:
  $('img').css({
    'border-radius' : '20px',
    'margin' : 'auto'
  });
  ```


CSS...

Great CSS! But a couple of comments:
- No need to add http: or https: at the start of your font import. You want the browser to decide whether it wants to be secured or not
- There shouldn't be any need to have position absolute and float right, float right will be overwritten
- If you are using newer properties such as rgba for example, be sure to provide a fallback as they will not work in older browsers (and remember that rgb exists if you don't need transparency)
- Along the same line, be sure to vendor prefix things like transition

Really good though!

_Controllers_

This is all spot on!  Very good code.

- I don't think you should need to define an @current_user because it comes from the application controller
- Instead of having multiple actions to render the same piece of information as either HTML or JSON, you could use [this sort of thing](http://apidock.com/rails/ActionController/MimeResponds/InstanceMethods/respond_to). This is much more common

Really nice stuff.

_Models_

Great work on the models. Good associations, nice validations.

_Views_

- Nice, cleanly indented code. Well done with all of this!
- Instead of using cycle to change background colours, it's probably best to just add classes to do that in the CSS.  Alternatively (and this would be my favourite way), you could just use some complex CSS selectors
- Great work on getting the D3 in there, I definitely think it is worth keeping that in its own file though
- I try and keep my application.html.erb as empty as possible, preferring to keep all the pieces in partials (like a nav partial for example)
- Try and avoid adding protocols to links, scripts and images (the http: and https: ) as you want the browser to make those decisions
- Always avoid accessing the database in a view (line 51 - 56 pages index for example)

_Config_

Nice clean routes.

_DB_

Really solid seeds file, nice migrations, and a well thought out schema.


You have done a brilliant job on all of this though John. Great stuff! Looking forward to seeing what you build next.