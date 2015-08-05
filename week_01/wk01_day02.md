## Week 01, Day 02.
### 04 / 08 / 2015

What we covered today.
- Javascript Date Types
- Javascript Control Structure

#### Introduction to Javascript

[Joel's Slides](http://www.teaching-materials.org/javascript/slides/varsfunctions.html)

> "Java is to Javascript, as ham is to hamster" - _Joel Turnbull_

> "We can't break the Web" - _Joel Turnbull_

Javascript is the most popular programming language in the World by a long way.  It works everywhere.

To be a programming language, a language needs to do the following things:
- Add 1 to a number
- Check if a number is equal to zero
- Branch - can alter flow

**SOMETHING REALLY IMPORTANT**

There are two audiences that see any program that you will write. There is the computer, and there is the next human who sees the code (who could well be you).  Prioritize the human! You need to make code readable and logical.

> "If given a program that works but is unreadable, and another that doesn't work but makes sense - I would take the one that doesn't work. I can still work with it and I understand it.  It isn't a nightmare."

[A short history of Javascript.](https://www.w3.org/community/webed/wiki/A_Short_History_of_JavaScript)

##### _Javascript Primitive Value Types_

**Strings** - an immutable string of characters
```js
var greeting = "Hello Kitty.";
var restaurant = "McDonalds";
```

**Numbers** - whole (6, -102) or floating point (5.8727)
```js
var myAge = 35;
var roughPi = 3.14;
```

**Boolean** - Represents logical values true or false
```js
var catsAreBest = false;
var dogsAreBest = false;
var wolvesAreBest = true;
```

**undefined** - Represents a value that has not been defined.
```js
var notDefinedYet;
```

**null** - Represents something that is explicitly undefined.
```js
var goodPickupLines = null;
```

##### Variable Names

- Begin with letters, $ or _
- Only contain letters, numbers, $ and _
- Case Sensitive
- Avoid [reserved words](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#Keywords)
- Choose clarity and meaning
- Prefer camelCase for multipleWords (instead of under_score)
- Pick a naming convention and stick with it

```js
// All Good!
var numPeople, $mainHeader, _num, _Num;

// Nope.
var 2coolForSchool, soHappy!;
```

Everything in Javascript returns the result of an expression.

```js
4 + 2;
// Returns 6.

8;
// Returns 8.

console.log("Hello World.")
// Passes a string into the console.log function. Then returns the result of this expression into the console.

// Variables can store the result of expressions as well.
var courseName = "W" + "D" + "I";
var testMultiplication = 5 * 7;

var x = 2 + 2;
var y = x * 3;

var name = "Pamela";
var greeting = "Hello" + name;
```

Javascript is a *Loosely Typed* language.

What this means is that Javascript will figure out the value of a variable by looking at the type of the result of the expression.

A variable can be of only one type at one time, but can be reassigned.

```js
var y = 2 + ' cats';
console.log(typeof y);
```

For a much more complex overview of the differences between loosely typed and strongly typed languages, [see here.](http://en.wikipedia.org/wiki/Strong_and_weak_typing)

Remember that they say you need to write 10000 words before you write a novel.  All of the stuff you are learning right now is a part of that 10000 words.  It's not meant to be perfect!

[Here is an exercise for you to muck around with.](https://gist.github.com/wofockham/901da450091e0e08af12)  And, Joel's solution for the first two exercises is [here.](https://github.com/wofockham/wdi-9/blob/master/01-javascript/ex1-vars/main.js)


##### Comments

Comments are human-readable lines of text that the computer will ignore.

In sublime text, `<CMND> + L` will toggle the comments.

```js
// This is a single line comment in JS

/*
    This is a block level comment
    i.e. multiline
*/

```

##### Functions

Functions are way to make a collection of statements re-usable. This is the most powerful thing in Javascript.

You need to declare them!

```js
function sayMyName () {
    console.log( "Hello Jane" );
}

// But functions are also data types, so they can be stored in a variable
// This is my favourite way of declaring functions! Stick to this.
var sayMyName = function () {
    console.log( "Hello Jane" );
}
```

If you want to see the difference between the function declarations, see [here](http://stackoverflow.com/questions/1013385/what-is-the-difference-between-a-function-expression-vs-declaration-in-javascrip) and [here.](https://javascriptweblog.wordpress.com/2010/07/06/function-declarations-vs-function-expressions/)

```js
// We need to call functions though, we do this by having the parentheses at the end
sayMyName();
```

###### Parameters or Arguments

Functions in Javascript can accept as many named parameters (or arguments) as it wants.  We can then use the arguments from within the function.  This is crazily powerful.

```js
var sayMyName = function ( firstName, lastName ) {
    console.log( "Hello, " + firstName + " " + lastName + "!");
}

sayMyName( "Jane", "Birkin" );

// We don't have to pass in plain data types, we can also pass in variables.

var serge = "Serge";
var gainsbourg = "Gainsbourg";
sayMyName( serge, gainsbourg );
```

###### Return Values

If you use the return keyword, we can return a value to wherever the function was called (it also leaves the function).

```js
function addNumbers( num1, num2 ) {
  var result = num1 + num2;
  return result; // Anything after this line won't be executed
}

var sum = addNumbers( 5, 2 );
console.log( sum ); // Logs 7.

// We can take this further though, because we can use functions calls in expressions.

var biggerSum = addNumbers( 2, 5 ) + addNumbers( 3, 2 );
// biggerSum is declared as 12.

// We can take it further again! Because we can call functions from within functions
var hugeSum = addNumbers( addNumbers( 5, 2 ), addNumbers( 3, 7 ) );
// hugeSum is declared as 12 here as well.
```


###### Scope

JS Variables have "function scope". They are visible in the function where they're defined:

A variable with "local" scope:

```js
function addNumbers( num1, num2 ) {
  var localResult = num1 + num2;
  console.log( "The local result is: " + localResult );
}

addNumbers( 5, 7 );
console.log( localResult ); // This will throw an error as localResult is defined in the function.

```

A variable with "global" scope:

```js
var globalResult;
function addNumbers( num1, num2 ) {
  globalResult = num1 + num2;
  console.log( "The global result is: " + globalResult );
}

addNumbers( 5, 7 );
console.log( globalResult );
// Because this wasn't defined in the function, it is available. Will log 12.
```

**Three things to know about functions:**
- You can pass things in as parameters (or arguments)
- You can return things (to allow for chaining or usage in expressions)
- Variables declared in a function (or passed in as parameters) have local scope (or function scope) - i.e. only accessible within it.

For a more in-depth dive into Javascript variable scope, see [here (this is very good)](http://speakingjs.com/es5/ch01.html#basic_var_scope_and_closures), [here](http://toddmotto.com/everything-you-wanted-to-know-about-javascript-scope/) and [here.](http://www.sitepoint.com/demystifying-javascript-variable-scope-hoisting/?utm_source=SitePoint&utm_medium=email&utm_campaign=Versioning)

###### Coding Conventions

Use newlines between statements and use indentation to show blocks.  We aim for readability.

```js
// BAD
function addNumbers(num1,num2) {return num1 + num2;}

function addNumbers(num1, num2) {
return num1 + num2;
}

// GOOD
function addNumbers(num1, num2) {
  return num1 + num2;
}
```

For information relating to javascript style, see the following:
- [Idiomatic JS - the best style guide](https://github.com/rwaldron/idiomatic.js)
- [All encompassing, check this out](http://addyosmani.com/blog/javascript-style-guides-and-beautifiers/)
- [AirBnB Style Guide - quite good](https://github.com/airbnb/javascript?utm_source=javascriptweekly&utm_medium=email)

Now that we know a bit more about functions, have a crack at [this exercise.](https://gist.github.com/wofockham/0cba52fac6cff19a3010)

Once you have had a look - [here is Joel's solution.](https://github.com/wofockham/wdi-9/blob/master/01-javascript/ex2-functions/main.js)

##### Control Flow with Javascript

###### Javascripts Comparison Operators

Use these operators to compare two values for equality, inequality or difference.

|Operator|Meaning                  |True Statements      |
|:-------|:------------------------|:--------------------|
|==      |Equality                 |28 == '28', 28 == 28 |
|===     |Strict Equality          |28 === 28            |
|!=      |Inequality               |28 != 27             |
|!==     |Strict Inequality        |28 !== 23            |
|>       |Greater than             |28 > 23              |
|>=      |Greater than or Equal to |28 >= 28             |
|<       |Less than                |24 < 28              |
|<=      |Less than or Equal to    | 24 <= 24            |

We can all of these in any statement or evaluation. Very useful for if's etc.

We should also use the strict equality and inequality operators. They compare type (i.e. strings, numbers etc.) as well as content.

###### Logical Operators

These are typically used in combination with the comparison operators, they are commonly used to group multiple conditions or for special types of variable declarations.

|Operator|Meaning|True Expressions|
|:-------|:------|:---------------|
|&&      |AND    |4 > 0 && 4 < 10 |
|||      |OR     |4 > 0 || 4 < 3  |
|!       |NOT    |!(4 < 0)        |

In any control flow statement in Javascript - we can use all logical and comparison operators.

**N.B.** Empty strings (""), 0, undefined and null are all considered false in javascript!

If you want to find out everything there is to know about Javascript Equality, see [here.](http://dorey.github.io/JavaScript-Equality-Table/)

###### The if Statement

We can use an if statement to tell js which statements to execute, based on a condition.

If the condition (the things within the parentheses) evaluates to true, it will run whatever is within the curly brackets.  Otherwise it will skip over it.

```js
var x = 5;

if ( x > 0 ) {
  console.log( "x is a positive number!" );
}

// This would run, unless the variable x had a value less than or equal to zero.
```

We can give an if statements multiple branches...

```js
var age = 28;
if (age > 16) {
  console.log('Yay, you can drive!');
} else {
  console.log('Sorry, but you have ' + (16 - age) + ' years til you can drive.');
}
```

It will always run one of them! But will never run both.

You can also use else if if you have multiple exclusive conditions to check:

```js
var age = 20;
if (age >= 35) {
  console.log('You can vote AND hold any place in government!');
} else if (age >= 25) {
  console.log('You can vote AND run for the Senate!');
} else if (age >= 18) {
  console.log('You can vote!');
} else {
  console.log('You have no voice in government!');
}
```

Now that we have done a bit of an introduction to if, else if, and else statements, have a go at [these exercises.](https://gist.github.com/wofockham/b347465420654df63be7)

##### Homework

- [These tasks](https://gist.github.com/wofockham/8f953ac7f33125898071)
- Bonus
  + Read [this](http://speakingjs.com/es5/)
  + Or [this](http://eloquentjavascript.net/)
  + [Link to download both](https://ga-students.slack.com/files/jack/F04JKNK74/javascript_books.zip)



