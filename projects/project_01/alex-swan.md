# Alex - Project 01 Feedback

Hey Alex! You should be so proud of this project, you did an incredible job. Every piece of code that I have seen you write is impressive, so I don't know how much I am going to be able to point out, but I will give it a go! Coding certainly seems to suit you, Alex.

_Readme_

Readmes are annoying to write, but incredibly important.  Not just for you, but for potential employers etc.  Try not to make them to code-focussed - more about what the application is about, the technologies that are used, point out existing bugs and features that you want to add next.  Think about as if you had to explain an entire application without showing a single line of code for the moment.  [This](http://stackoverflow.com/questions/2304863/how-to-write-a-good-readme#answers) isn't a bad description of what should go in there. Normally people would have a README file called README.md, so if you are going to work on the readme, it might be worth changing the file name.

_Gemfile_

Some cool Gems in here, well done on getting them up and running!

_App/Assets_

Javascript...

All looks really good in here, only one small comment...  Because you are using Turbolinks, in some cases the document won't reload on change of the page - meaning the document won't ever fire a ready event.  To solve this, there is a gem called jquery-turbolinks, but even easier:

```js
$(document).ready(function () {
  // Code goes here.
});

$(document).on('ready page:load', function(event) {
  // Code goes here.
});
```

This will fire it every time!

CSS...

Great CSS! But a couple of comments:

- No need to add http: or https: at the start of your font import. You want the browser to decide whether it wants to be secured or not
- A few small indentation things, but nothing serious (line 43 of custom.css.scss for example)
- Instead of using the !important flag, you should just try and be a little bit more specific (you could give an id or prefix the selector with body, something along those lines)
- Good use of floats - I don't mind floats (particularly when compared to Joel) - you have used them well

_Controllers_

This is all spot on!  Very good code.

- Remember that the .find method takes an id by default and is optimised to search with an id. The .find_by method can receive an ID but can be a little bit slower.  Very small thing but ` User.find_by :id => session[:user_id] ` can be rewritten as ` User.find( session[:user_id] ) `
- It's often nice to give custom error messages - you can do that by using the flash method, have a look [here](http://api.rubyonrails.org/classes/ActionDispatch/Flash.html) for more information. It's often a nice touch though!
- When you have a lot of functionality in controllers, it's always best to have all the hardwork happening in private methods - or better yet in models or in the helpers folder
- A little bit more common to use unless rather than if not equal to (it's just the Ruby way - line 55, homes controller)

Really nice code.

_Models_

- Great associations in here
- I would have liked to have seen a few more validations on things other than presence - such as the format of emails - but it's good to see that you have some validations!

_Views_

- Nice, cleanly indented code. Well done with all of this!
- Great work with all of the forms
- Make sure to try and use path names instead of explicit urls (like the difference between root_path and "/")
- There is some complex logic going on in the views, and a few times it would have been a little bit nicer to have that in the models
  ```ruby
  @bill.bill_start.strftime "%A, %e %B %Y" if @bill.bill_start
  # Could be rewritten in the model for example
  ```
- I try and keep my application.html.erbs really empty, preferring to use partials - take the nav for example, I almost always think that that should be in a partial
- Amazing work with the calendar stuff!

Great stuff in here Alex.

_Config_

Nice clean routes.

_DB_

Really solid seeds file, nice migrations, and a well thought out schema.


I know I keep saying it Alex, but this absolutely amazing. It's crazy to see how far you have come in a relatively short period of time.  Really well done.