# Alex, Phil and Robinson - Soundflake - Project 02 Feedback
​
I can't tell you how impressed I am by what you all managed to accomplish in such a short period of time. You set out on this project with lots of things to learn, and it is remarkable how quickly you got your head around those things - Web Audio, Paper.js and Backbone, wow.  You nailed it! You made a project that looks brilliant, works really well, and will be very impressive at the meet and greet. People will love this project!

_Readme_
​
Quite a good Readme file, I'd like to see a bit more of a mention about local set up instructions, definitely add links to each one of your Github profiles, known errors.  But this is good.

_App/Assets_
​
JS...

- Make sure you delete commented out code - that stuff will all be stored in Git anyway
- Really clean Backbone code
- It would be cool to see a little bit of documentation in regards to all of the complex animation code
- It would be good to see some of these loops optimised into Underscore loops as well - that way they will be as efficient as possible
- A little bit of duplication with things about the canvas height for example. It would be best best to have a function that set up those variables for you - and which would be called when the window is resized.
- It would be great to see a little bit more error handling with some of the cases in the switch statement. Maybe you could also think about going to the next song in the search results page if one of the songs didn't work

Absolutely brilliant JS though, really neat, well-written code.
​
CSS...

- Make sure you browser prefix newer properties such as transition
- When you are using newer values as well, such as things like VH and VW, it is always best to provide a fall back that will work in older browsers

Good CSS though.
​
_Controllers_
​
- Probably best to avoid keeping API keys etc. in the pages controller, only because people will be able to use your credentials. It's probably worth checking out a way to use the secrets.yml file in your application or investigating some other way to hide important things like that (Figaro, dot env etc.)

_Views_
​
- Always best to leave the protocol of links and scripts etc. (the http: and https:), let the browser decide that stuff
- It's probably best to leave the normalize css file in the rails stylesheet folder as well, that way it will be minified etc. Same with the paper js file
- Always avoid having styles in your HTML!
- ​Most of the time it is best to avoid javascript in your HTML as well


It was outrageously fun helping out on this project and I am blown away but what you managed to accomplish.  It's absolutely incredible! I can't wait to see what you all manage to produce in the final projects.  Really, really well done.