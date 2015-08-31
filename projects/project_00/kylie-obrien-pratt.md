# Kylie - Tic Tac Toe Project Feedback

Really nice work on this Kylie. For someone who is knew to coding, it is impressive that you got all of this stuff working in a short amount of time. I can't wait to see what you build next!  Anyway, better make a few comments about the actual code.

## HTML

Your HTML is good!  My only comments would be:

- Remember to always call the main file in a project index.html. That means if you go to your domain name - it will automatically load. It is considered the root of the server!
- A few small indentation issues - remember to only indent once for every child
- If there is commented out code, just delete it. It should be in the Git history
- Definitely try to avoid writing inline javascript!

But very nice!

## CSS

Very nice again, but a couple of comments:

- Due to the cascading nature of CSS, if you apply the font-family and color to the body, it will change all the text on the page (except links - because they are annoying). It's a little bit better to do that rather than applying those styles to everything
- Remember to always include a unit of measurement (pixels etc.)
- There is a little bit of duplication in the cell stuff towards the end of your CSS file. Remember that you can comma seperate selectors.  If I were you, I'd be adding a class to all cells so you can apply the width to all of those things at once

There is some really nice CSS in here though, well done.

## JS

This is great!!

- Remember when you are defining functions, always use this approach - ` var myFunc = function () {} ` rather than ` function myFunc () {} `
- Try and use jQuery as much as possible!
  + ` window.onload ` vs. ` $(document).ready() `
  + ` document.getElementsByClassName("btn").onclick ` vs. ` $(".btn").click() `
  ```
  $('#cell-1x3')[0].style.backgroundColor = "red";
  $('#cell-2x3')[0].style.backgroundColor = "red";
  $('#cell-3x3')[0].style.backgroundColor = "red";

  vs.

  $("#cell-1x3, #cell-2x3, #cell-3x3").css("background", "red");
  ```

It's all a really nice solution though. Your code is neat and well-formatted. You did a brilliant job Kylie!!  Let me know if you want to have a chat about anything - always happy to help.