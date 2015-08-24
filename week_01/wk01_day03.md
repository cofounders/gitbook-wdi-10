## Week 01, Day 03.
### 05 / 08 / 2015

What we covered today:
- [Warmup Exercise](https://gist.github.com/ga-wolf/9de7dbf52ff627d33846)
    + [Documented Solution](https://github.com/ga-wolf/WDI10-Homework/tree/master/warmup-exercises/week_01)
- Demos (of [this homework](https://gist.github.com/wofockham/8f953ac7f33125898071))
- Git and Github
- Loops in Javascript
- Talk with Penny
- Collections in Javascript

#### Git and Github

###### A very short history...

A Version Control System designed and developed by a Finnish guy, Linus Torvalds, for the Linux kernel in 2005.  Apparently, he named it Git because of the British-English slang meaning "unpleasant person".  Torvalds said: "I'm an egotistical bastard, and I name all my projects after myself".

###### What does it do?

- A way to snapshot - you get a time machine
- A way to collaborate - working in parallel
- Saves us from moving code around on Floppy Disks
- Automates merging of code
- Lets you distribute a project

N.B. It is quite hard to understand, and you won't understand most of the problems that it solves yet! Just trust us.

Git is on your local computer. Github is in the cloud - it is the central repository!

For a nice introduction to it, see [here.](https://try.github.io/levels/1/challenges/1)  P.S. Octocat is the logo!

Some basic Git commands:

- `git init` - This initializes the git repository (behind the scenes it creates a .git file in the folder - it has called .git because any file prefixed by a . is hidden in finder and ls).  Make sure you don't do this in another git repository!
- `git status` - This will tell you what is happening the current project. Commit status, untracked files etc.
- `git add .` - This will add all files in the current directory into the "staging area".  Git is now paying attention to all files. You can alternatively specify a particular file - `git add octocat.txt`.  We could also add all files of a particular type - `git add '*.txt'` (this needs quotes!) or multiple files at a time - `git add octocat.txt blue_octocat.txt`.
- `git commit -m "You're commit message` - This is the thing that takes the snapshot. You must give it a message!
- `git log` - Will show you all of the snapshots in the current project
- This has all been happening locally! So we need to connect it to Github...
- `git remote add origin https://github.com/try-git/try_git.git` - It takes a *remote name*, the word origin, and a *remote repository*, the URL.
- `git push -u origin master` - The first time you run git push (which moves it up to github), make sure you specify `-u origin master`.  This tells your local machine to always use the remote link you specified in the step before. Once you have done this - you can run `git push` from now on
- `git pull` - this brings the code down from Github
- `git diff HEAD` - this will show the differences between the current commit and the previous commit
- `git diff --staged` - You can show the differences between the currently staged files by using this command
- `git reset FILENAME` - Will remove the specified files or folders from the staging area (so they won't be pushed!)
- `git checkout -- octocat.txt` - This will go back to the last commit involving the octocat.txt file using this.
- `git branch clean_up` - This allows us to work in an alternate reality - changes you make here won't effect anything in other branches
- `git checkout clean_up` - Will move to the clean_up branch.
- `git rm FILENAME FILENAME` - Will not only delete the file on your computer, but also remove it from the staging area with Git.
- `git add .` then run `git commit -m "COMMIT NAME"`.  This will take a screenshot of the current branch position.
- `git checkout master` - This will move to the master branch.
- `git merge clean_up` - Will merge the clean_up branch into the current branch.
- Now that everything has been merged, we can delete the clean_up branch - `git branch -d clean_up`.
- We can run `git push` now! Everything is up there.

**A really basic process:** (Follow these steps every time!)

- `git add .`
- `git commit -m "Commit message`
- `git pull`
- `git push`

**Some good github tutorials:**
- [A tutorial by the folks at Atlassian](https://www.atlassian.com/git/tutorials/setting-up-a-repository/)
- [A tutorial by Roger Dudler](https://rogerdudler.github.io/git-guide/)
- [A tutorial by Git Tower](https://www.git-tower.com/learn/)

#### Loops in Javascript

###### The While Loop

The while loop will tell JS to repeat the statements within the curly brackets until the condition is true.  It is ridiculously easy to make infinite loops with these. Beware!  They'll crash your browsers and crush your spirits.

You need a condition in the parentheses, and you need something within the body (between the curly brackets) that will eventually change the condition to be false.

```js
var x = 0;

while (x < 5) {
  console.log(x);
  x = x + 1;
}
```

###### The For Loop

A for loop is another way of repeating statements, more specialized than while.

It looks like the following:

```js
for (initialize; condition; update) {

}

var x = 0; // This is the initialize value
while (x < 5) { // This is the condition (in the parentheses)
    console.log(x);
    x = x + 1; // This is the update
}

// To change this while loop into a for loop...

for (var x = 0; x < 5; x = x + 1) {
    console.log( x )
}
```

###### The Break Statement

To prematurely exit any loop, use the break statement:

```js
for (var current = 100; current < 200; current++) {
    // current++ is the same current += 1 and current = current + 1
    // current-- also exists (minus 1)
    // Called syntactic sugar

    console.log('Testing ' + current);
    if (current % 7 == 0) {
        // The % stands for the modulus operator, it finds the remainder
        console.log('Found it! ' + current);
        break;
    }
}
```

Now that you have done a bit more on loops, have a crack at these [exercises.](http://www.teaching-materials.org/javascript/exercises/forloops.html)

###### Recursion (Basics)

We will get into this a lot more, but basically - we can call functions within functions. This allows us to recreate loops!

See [here](http://repl.it/l50) for an example.

#### Collections in Javascript

###### The Array Data Type

An array is a type of data that holds an ordered list of values, of any type.  They are sequences of elements that can be accessed via integer indices starting at zero (it can be zero elements along as well).  More or less, it is a special variable that can hold more than one value at a time.

Repeating myself... But the indexes start at zero!

**How to create an array**

- `var testArray = [ 1, 2, 3 ];` - This is an array literal - definitely the way you should do it.
- `var testArray = new Array( 1, 2, 3 );` - Uses the Array constructor and the keyword new. Does the same thing, but stick to the other way.

**How to access arrays**

```js
var amazingFrenchAuthors = [ "Alexandre Dumas", "Gustave Flaubert", "Voltaire", "Marcel Proust", "Jean-Paul Sartre", "Stendhal", "Anäis Nin", "Simone de Beauvoir", "Rene Descartes", "Montesquieu" ];

console.log( amazingFrenchAuthors[0] ); // Logs "Alexandre Dumas"
console.log( amazingFrenchAuthors[3] ); // Logs "Marcel Proust"

// You can use variables and expressions to access elements in arrays as well!
var theBestOfTheBest = 4;
console.log( amazingFrenchAuthors[ theBestOfTheBest ] ); // Logs "Jean-Paul Sartre"
console.log( amazingFrenchAuthors[ amazingFrenchAuthors.length - 1 ] ); // Logs "Montesquieu" (the last element)

// This will turn a string into an array, with each element defined by the space
var bros = "Groucho Harpo Chico Zeppo".split(" ");
```

**How to iterate through elements in an array**

Stick to the for loop in most cases, but there are always thousands ways of doing things.

```js
var greatPeople = [ "Louis Pasteur", "Jacques Cousteau", "Imhotep", "Sigmund Freud", "Wolfgang Amadeus Mozart" ];

for ( var i = 0; i < greatPeople.length; i++ ) {
    console.log( greatPeople[ i ] ); // Will log out the "i-th" element
}


[ 'a', 'b', 'c' ].forEach( function (elem, index) {
    console.log(index + '. ' + elem);
});

// This will return:
// 0. a
// 1. b
// 2. c

```

Have a crack at [these exercises.](https://gist.github.com/wofockham/9a712de6d322966e16d4)

**How to set elements in an array**

```js
var amazingFrenchAuthors = [ "Alexandre Dumas", "Gustave Flaubert", "Voltaire", "Marcel Proust"];

amazingFrenchAuthors[0] = "Stendhal"; // Just access them and reassign!

console.log( amazingFrenchAuthors );
// Logs [ "Stendhal", "Gustave Flaubert", "Voltaire", "Marcel Proust"]
```

**Common Methods and Properties for Arrays!**

*Properties, Methods and Functions*

```js
var amazingFrenchAuthors = [ "Alexandre Dumas", "Gustave Flaubert", "Voltaire", "Marcel Proust"];

console.log( amazingFrenchAuthors.length ); // Returns 4 - doesn't use a zero index

// POP //
amazingFrenchAuthors.pop(); // Removes the last element from an array and returns that element.
// END POP //

// PUSH //
amazingFrenchAuthors.push(); // Adds one or more elements to the end of an array and returns the new length of the array.
// END PUSH //

// REVERSE //
amazingFrenchAuthors.reverse(); // Reverses the order of the elements of an array — the first becomes the last, and the last becomes the first.
// END REVERSE //

// SHIFT //
amazingFrenchAuthors.shift(); // Removes the first element from an array and returns that element.
// END SHIFT //

// UNSHIFT //
amazingFrenchAuthors.unshift(); // Adds one or more elements to the front of an array and returns the new length of the array.
// END UNSHIFT //

// JOIN //
amazingFrenchAuthors.join(); // Joins all elements of an array into a string.
// END JOIN //

// SPLICE //
amazingFrenchAuthors.splice(); // Adds and/or removes elements from an array.
amazingFrenchAuthors = ["Alexandre Dumas", "Gustave Flaubert", "Voltaire", "Marcel Proust"];
amazingFrenchAuthors.splice(1,1);
// returns ["Gustave Flaubert"]
// amazingFrenchAuthors is ["Alexandre Dumas", "Voltaire", "Marcel Proust"]

amazingFrenchAuthors.splice(1,1, "Gustave Flaubert");
// Returns the deleted items, and adds in the next parameters ["Voltaire"]
// amazingFrenchAuthors is ["Alexandre Dumas", "Gustave Flaubert", "Marcel Proust"]
// END SPLICE //

amazingFrenchAuthors = ["Alexandre Dumas", "Gustave Flaubert", "Marcel Proust"];

// INCLUDE //
amazingFrenchAuthors.include( "Alexandre Dumas" ); // Returns true.
amazingFrenchAuthors.include( "Montesquieu" ); // Returns false.
// END INCLUDE //

// INDEX OF //
amazingFrenchAuthors.indexOf("Alexandre Dumas"); // Returns 0.
amazingFrenchAuthors.indexOf("Anäis Nin"); // Returns -1 if it doesn't find anything
// END INDEX OF //
```

#### Homework

- Here is the Word Guesser [homework.](https://gist.github.com/wofockham/61148df9403b3cfc2138)
- Here are a bunch of additional [exercises.](https://gist.github.com/wofockham/61148df9403b3cfc2138)
- Here are some additional readings
    + [MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array)
    + [Quite a good one](http://javascript.info/tutorial/array)
    + [Speaking Javascript](http://speakingjs.com/es5/ch01.html#basic_arrays)
    + [Way more than you'll ever need](http://www.hunlock.com/blogs/Mastering_Javascript_Arrays)