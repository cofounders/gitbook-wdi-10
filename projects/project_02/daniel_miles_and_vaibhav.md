# Daniel, Miles and Vaibhav - VDM List - Project 02 Feedback
​
Really well done with this project, you guys brought together so many features and it all seemed to work really cohesively. It also seemed as if all of the teamwork stuff went really smoothly which is good to see (though, maybe I just missed it...).  Great work!
​
_Readme_
​
Readmes are annoying to write, but incredibly important.  Not just for you, but for potential employers etc.  Try not to make them to code-focussed - more about what the application is about, the technologies that are used, point out existing bugs and features that you want to add next.  Think about as if you had to explain an entire application without showing a single line of code for the moment.  [This](http://stackoverflow.com/questions/2304863/how-to-write-a-good-readme#answers) isn't a bad description of what should go in there. Normally people would have a README file called README.md, so if you are going to work on the readme, it might be worth changing the file name.

_Gemfile_
​
Some cool gems in here!

_App/Assets_
​
JS...
​
- A heap of repetition throughout the itemPost file, I think you guys could definitely come up with a way around that!
- Try and avoid writing all of your code in a document.ready as it means that all of that code will not be executed until the DOM tree has been made. If most of the grunt work is done before the document is loaded, it can work a lot better
- I try and use Modernizr to detect features so as to not stuff up browser compatibility. Take pushstate: true for example, that only goes back to IE10 I think, so I would use Modernizr to detect whether pushstate is available to determine whether I would use that or not
- There is a little bit of code that seems to be unfinished - if it isn't doing anything at the moment, it is probably best to remove it or complete it (bookmarkListView for example)

Really nice clean Javascript though.

CSS...
​
Your CSS all looks very clean, it shows that you guys nailed using Bootstrap as you didn't seem to have to write that much extra code.

_Controllers_
​
- Good use of before_actions and the application_controller
- Probably best to avoid using methods called "api" as it can send confusing messages. The normal way that this is approached is to have all of your methods be able to respond to both HTML and JSON using the respond_to block
- A few indentation issues in some of the controllers but nothing too bad
- It is best to have default attributes on models stored on the actual model rather than set in controllers (items_controller line 79)
- I'd definitely avoid using class variables (ones prefixed with @@). I see why you have used them, but it is best to scope the URL so as to store the item_id or approach it in some other way. But class variables can end up throwing lots of errors (transactions controller)
- With things like the formatting of the address, that stuff belongs on the model because you will only want to be able to access that sort of thing (users_controller line 42). Normally if it is concerning an individual model, or concerning the class as a whole (User for example), I try and keep that stuff stored on the model

Really nice code though.
​
_Models_
​
- Spot on associations
- I would have liked to have seen a few more validations but there are a few there!
- Make sure you delete commented out code and let Git store that stuff for you
- Great to see some custom methods stored on these models though

Great work!

_Views_
​
- I tend to avoid using json.jbuilders only because it gives you a little more control and means that all the concerns with receiving and storing the data is in the controllers or in the models, and it is only pure presentation in the views
- Brilliant use of partials (and cool to see you passing local variables into them)
- Great use of form helpers
- I'd like to see the navigation taken out of the application.html.erb and stored in a partial just so as to make the main layout very clean

Neat, well-indented code though!

_Config_
​
Wow, great routes file!  Good to see some custom initializers as well - such as the mailboxer.rb
​
_DB_
​
Absolutely brilliant seeds file. Your schema looks good too, though it might be an idea to break down the items table into some smaller categorized tables
​


Really, really nice code guys.  You all have nailed it. Looking forward to seeing what you build next!  Let me know if you have any questions about any of this feedback.  Great work, once again.