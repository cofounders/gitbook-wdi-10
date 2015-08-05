## Week 01, Day 04.
### 30 / 04 / 2015

What we covered today:
- Sublime Text Tips
- Demos
- Javascript Objects

#### Javascript Objects

In Javascript, an object is a standalone entity - filled with properties and types (or keys and values).  It is very similar in structure to a dictionary.

So most javascript objects will have keys and values attached to them - this could be considered as a variable that is attached to the object (also allows us to iterate through them).

They are sometimes called assosciative arrays.  Remember that they are not stored in any particular order (they can change order whenever).

**How to create a Javascript Object**

```js
// With object literal
var newObject = {};

// Using Object
var newObject = new Object();
```

**How to add Properties**

```js
// Remember to seperate by commas!
var newObject = {
  objectKey: "Object Value",
  anotherObjectKey: "Another Object Value",
  objectFunction: function () {

  }
};

var newObject = {};
newObject.objectKey = "Object Value";
newObject.objectFunction();
newObject["anotherObjectKey"] = "Another Object Value";

// Can also use Constructors and Factories - see Week 1 Day 5 notes.
```

**How to access properties**

Like all JS variables - both the object name and property names are case sensitive.

```js
var favouriteCar = {
  manufacturer: "Jaguar",
  year: 1963,
  model: "E-Type"
}

favouriteCar.year

// Or

favouriteCar["year"]
```

**How to iterate through an object**

```js
Object.keys(newObject); // Returns an array of all the keys in the specified object.
Object.getOwnPropertyNames(newObject); // So does this

var obj = {
  a: 1,
  b: 2,
  c: 3
};

for (var prop in obj) {
  console.log( "o." + prop + " = " + obj[prop] );
}
```

**Deleting Properties**

```js
var favouriteCar = {
  manufacturer: "Jaguar",
  year: 1963,
  model: "E-Type"
}

delete favouriteCar.year;
```

**Comparing Objects**

In JavaScript objects are a reference type. Two distinct objects are never equal, even if they have the same properties. Only comparing the same object reference with itself yields true.

```js
// Two variables, two distict objects with the same properties
var fruit = { name: "apple" };
var fruitbear = { name: "apple" };

fruit == fruitbear; // return false
fruit === fruitbear; // return false

// Two variables, a single object
var fruit = { name: "apple" };
var fruitbear = fruit;  // assign fruit object reference to fruitbear

// Here fruit and fruitbear are pointing to same object
fruit == fruitbear; // return true
fruit === fruitbear; // return true
```

No simple way though.  Underscore js has an implementation - "_.isEqual", lots of alternatives [here](http://stackoverflow.com/questions/1068834/object-comparison-in-javascript), but I would stick to the underscore method.  I love [underscore](http://underscorejs.org/).

**Common Object Methods**

```js
Object.length; // Returns the amount of properties
Object.freeze(); // Makes it undeleteable and unchangeable
Object.defineProperty();
Object.defineProperties();
Object.observe();
Object.watch();
Object.hasOwnProperty();
Object.isPrototypeOf();
```

#### Homework

[Geometry Function lab and the Bank.](https://gist.github.com/wofockham/dacf2da17c743afb2b17)