# Zac and Tamara - Lighting App - Project 02 Feedback
​
Ola Zac and Tamara! Well done on this project, it ended up working really well and it looks great!  It is genuinely useful by the way, so I hope you keep working on it.  If I were you two - I would be trying to allow it to work for construction workers - so that when someone is building an apartment building (or planning to), they know how many lights per floor, and the costs associated with them. But regardless, really well done!
​
_Readme_
​
Readmes are annoying to write, but incredibly important.  Not just for you, but for potential employers etc.  Try not to make them to code-focussed - more about what the application is about, the technologies that are used, point out existing bugs and features that you want to add next.  Think about as if you had to explain an entire application without showing a single line of code for the moment.  [This](http://stackoverflow.com/questions/2304863/how-to-write-a-good-readme#answers) isn't a bad description of what should go in there. Normally people would have a README file called README.md, so if you are going to work on the readme, it might be worth changing the file name.

_Gemfile_
​
Some cool gems in here!

_App/Assets_
​
Good to see you two using SVG's.  I think they are the best - they are responsive, means you can edit the colours with CSS and you can animate them. It's brilliant!

JS...

- I'd really like to see all the details about the globes being stored in a database - then using AJAX to access it - but it works well for the moment!
- When naming things, only prefix a variable name with a $ if the variables stores an actual HTML element that has been selected with jQuery - otherwise it can get a little confusing.
  ```
  var $body = $("body"); // E.g. like this
  ```
- I prefer to avoid using the + sign to turn a string into a number (only because some people don't recognise it).  I prefer to use the parseInt function or the number function.  It makes it a little bit more readable
  ```
  +$('#Hours').val(); // verse...
  Number( $('#Hours').val() );
  parseInt( $('#Hours').val() );
  ```
​- Your javascript is really nice though, some complicated functions in there! And lots of Maths which is cool to see

CSS...

- Remember that you can comma seperate CSS selectors
- Skip the protocol (meaning the http: or https:) on the import of the font on line 3 of application.scss - you should try and let the browser decide whether it should be downloaded securely or non-securely
- Really nice, clean CSS though
​
_Controllers_
​
- Great use of the application controller
- Good work getting the email stuff up and running!
- In the pages controller, you need to make sure that the methods are inside of the class otherwise this stuff won't work as expected
- The sessions_controller is nice
​
_Models_

- Great to see some validations in here!
​
_Views_
​
- Good work on getting the simple_form stuff implemented
- Make sure to not add spaces around attributes
  ```
  <div class= "hidden"> <!-- Should be written as... -->
  <div class="hidden">
  ```
- I would like to see the application.html.erb with a little bit less code in it.  Partials work really well for this sort of stuff - you could have a nav partial
- Make sure you don't store styles as attributes on HTML elements - such as the width and the height on the canvas in pages/home.html.erb. That stuff belongs in the CSS
- Really nice, well-indented code
​
_Config_
​
Nice, clean routes!
​
_DB_
​
Clean Schema.
​


You too have done a brilliant job on this stuff Zac and Tamara.  It looks great and works really well. You should be very proud of yourselves.  I can't wait to see what you two build for your final projects!  Let me know if you have any questions about the feedback (or about anything!).