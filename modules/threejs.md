# [THREE.js](http://threejs.org/)

_What is it?_

> The aim of the project is to create a lightweight 3D library with a very low level of complexity — in other words, for dummies. The library provides canvas, svg, CSS3D and WebGL renderers.

More or less, it is an attempt to make 3D stuff in browsers accessible. It normally uses WebGL which is a native Javascript API to do all of its animations.

Couple of comments. WebGL and CSS3D are both hardware (or GPU) boosted - meaning it uses the computer rather than the browser to do the rendering but both have low browser support.  Canvas and SVG have much better support. But WebGL is by far the best renderer.

_But wait, what are Javascript APIs?_

They are things that came natively with Javascript (so a little different to normal APIs) - they are built-in libraries. There are [thousands of them](https://developer.mozilla.org/en/docs/Web/API) and they each do different things

_Examples_

- [Cube Slam](https://www.cubeslam.com/awgytc)
- [HexGL](http://hexgl.bkcore.com/play/)
- [George and Jonathan](http://www.georgeandjonathan.com/#1)
- [Hello Run, Hello Enjoy](http://hellorun.helloenjoy.com/)
- [Samsung's Hello Racer](http://helloracer.com/racer-s/)
- [The Carp and the Seagull](http://thecarpandtheseagull.thecreatorsproject.com/)
- [Trigger Rally](https://triggerrally.com/)
- [Chaos to Perfection](http://www.chaostoperfection.com/)
- [Your Way to Oz](http://www.findyourwaytooz.com/)

_How to include it?_

Just like any other javascript library. Reference the following script before your own!

` curl https://cdnjs.cloudflare.com/ajax/libs/three.js/r71/three.min.js > three.min.js `

` curl https://raw.githubusercontent.com/mrdoob/three.js/master/examples/js/controls/OrbitControls.js > orbitControls.js `

_Basic Example_

There are a couple of things that we need for any THREE.js page.  They are the following:

- A camera
- A scene
- A renderer

THREE.js applications are hard to structure. It is really important that we namespace everything with a global object - just like we did with Backbone.

```js
var app = app || {};
```

We will now define a function called init - nested within app of course - that will create our scene(s), renderer(s) and camera(s).  Let's make it call that function on page load as well.

```js
app.init = function () {
  console.log( "App init called." );
}

window.onload = app.init;

// OR
// window.onload = function () {
//   app.init();
// }
```

Let's go ahead and make the actual camera.  A camera needs a few things, it needs a:

- a Field of View
- a Ratio
- Near - this is where the renderer will actually worry about showing things
- Far - same as above

```js
app.camera = new THREE.PerspectiveCamera( 45, window.innerWidth / window.innerHeight, 1, 1000 );
app.camera.position.z = 200;
```

We need to create a Scene, then add the actual camera into it.

```js
app.scene = new THREE.Scene();
app.scene.add( app.camera );
```

Now, we need to create the renderer - this is the thing that will actually show the page.

Renderers are a must have - and remember that we can use canvas, svg, CSS3D and WebGL renderers. Today we will use WebGL to render it - this is because it is hardware boosted, and the most common.

We need to set the size of the renderer, and set its background.

```js
// AT THE TOP OF APP.INIT
app.width = window.innerWidth;
app.height = window.innerHeight;
// ...

// Create the Renderer.
app.renderer = new THREE.WebGLRenderer();

// Set the Size of the Renderer.
app.renderer.setSize( app.width, app.height );

// Set the Background Color, and it's opacity.
app.renderer.setClearColor( 0xE3F2FD, 1 );
```

Let's have a look what the actual renderer is...

```js
console.log( app.renderer );
```

It is a big object, but the important thing for us is the DOM element that it created for us. Let's put that on the page.

```js
// Place the renderer onto the page.
document.body.appendChild( app.renderer.domElement );
```

Still, nothing has happened. We need to actually render the thing!

This requires a few things, what scene to render, and using what camera.

```js
app.renderer.render( app.scene, app.camera );
```

At this point, your JS file should look like this.

```js
var app = app || {};
app.init = function () {
  // Store the Size of the window.
  app.width = window.innerWidth;
  app.height = window.innerHeight;

  // Set the Camera up. ( Field of View, Ratio, Near, Far )
  app.camera = new THREE.PerspectiveCamera( 45, app.width / app.height, 1, 1000 );
  app.camera.position.z = 200;

  // Set the Scene up. Then add the camera onto the page.
  app.scene = new THREE.Scene();
  app.scene.add( app.camera );

  // Create the Renderer.
  app.renderer = new THREE.WebGLRenderer();
  // Set the Size of the Renderer.
  app.renderer.setSize( app.width, app.height );
  // Set the Background Color, and it's opacity.
  app.renderer.setClearColor( 0xE3F2FD, 1 );

  // Place the renderer onto the page.
  document.body.appendChild( app.renderer.domElement );
  // Actually Render it.
  app.renderer.render( app.scene, app.camera );
}

window.onload = app.init;
```

Let's go ahead and actually figure out how to put things on the page.  We will add a box for the first thing.

THREE.js has a lot of so called "Geometries". These are the basic blueprints for our shape construction.  Box is probably the most simple.

Let's put that in a function by itself, called addBox.

```js
// x, y, z.
var boxShape = new THREE.BoxGeometry( 20, 20, 20 );
```

We then need to define what the shape is made of.

```js
// An object of properties
var material = new THREE.MeshBasicMaterial( { color: 0x1A237E, wireframe: true } );
```

By this point, the cube and material are just hovering in memory and aren't associated. We need to create the three dimensional cube and actually put it on the page!

```js
// Create the cube using the box and it's material ( or mesh ).
app.cube = new THREE.Mesh( shape, material );
// Add it to the scene.
app.scene.add( app.cube );
```

One of the most annoying things about THREE.js is the fact that you have rerender after every change. There are ways around it but they are difficult.  For the moment, let's just render it!

```js
app.renderer.render( app.scene, app.camera );
```

Your app.addBox function should look like this...  Call it at the end of your app.init!

```js
app.addBox = function () {
  // Create a box ( x, y, z ).
  var shape = new THREE.BoxGeometry( 20, 20, 20 );
  // Create a mesh (that it will be made up of).
  var material = new THREE.MeshBasicMaterial( { color: 0x1A237E, wireframe: true } );

  // Create the cube using the box and it's material ( or mesh ).
  app.cube = new THREE.Mesh( shape, material );
  // Add it to the scene.
  app.scene.add( app.cube );

  // Rerender the page.
  app.renderer.render( app.scene, app.camera );
}
```

Let's do a basic animation of this cube.  There are a bunch of things that we need to do with this...

Up until 2011ish, to do animations, we used to set a bunch of timers and had to rerender everything after every change.  Browsers figured that it was best to combine this into an API. This is called the requestAnimationFrame API.  This is a brilliant thing...

- It will only animate when the page or tab is actually being looked at
- Can combine multiple animations into one individual "redraw" - where all animations are actually shown - CSS, JS and SVG animations can all be done at once and are all hardware boosted.

Read [here](http://www.paulirish.com/2011/requestanimationframe-for-smart-animating/) for more information.

Let's make a function called app.animate.

```js
// Use the requestAnimationFrame API. Pass in the function that we want to use for the animations.
requestAnimationFrame( app.animate );
```

And let's do a bit of a rotation, remembering that we have to actually rerender the actual content.

```js
app.cube.rotation.x += 0.05;
app.cube.rotation.y += 0.05;
app.cube.rotation.z += 0.05;

// Rerender the scene.
app.renderer.render( app.scene, app.camera );
```

Your app.animate file should now look like this. Call this function at the end of your app.init!

```js
app.animate = function () {
  requestAnimationFrame( app.animate );

  app.cube.rotation.x += 0.05;
  app.cube.rotation.y += 0.05;
  app.cube.rotation.z += 0.05;

  // Rerender the scene.
  app.renderer.render( app.scene, app.camera );
}
```

Let's make a circle! To do this, we will make an app.addCircle function. Remember that we need to make the shape and material in memory before we can do anything with them.

```js
// Create a circle, ( radius, segments, rings ).
var circleShape = new THREE.SphereGeometry( 50, 16, 16 );

// Create it's material.
var material = new THREE.MeshBasicMaterial( { color: 0xEC407A, wireframe: true } );

// Create the sphere with the material.
app.sphere = new THREE.Mesh( circleShape, material );
```

Then add it to the scene! And, rerender (if you don't have the animate function calling.)

```js
app.scene.add( app.sphere );

// app.renderer.render( app.scene, app.camera );
```

Your app.addCircle function should look like this...  Call it before your app.animate function call in the app.init.

```js
app.addCircle = function () {
  // Create a circle, ( radius, segments, rings ).
  var circle = new THREE.SphereGeometry( 50, 16, 16 );
  // Create it's material.
  var material = new THREE.MeshBasicMaterial( { color: 0xEC407A, wireframe: true } );
  // Create the sphere with the material.
  app.sphere = new THREE.Mesh( circle, material );

  // Add it to the scene.
  app.scene.add( app.sphere );
  // Rerender to show the changes.
  app.renderer.render( app.scene, app.camera );
}
```

We can probably use some events to make this a little bit more interactive.

Why the numbers? THREE.js places everything on a 3D plane, starting at the center of the screen. Whereas, the event.clientX is based on the top left of the screen.

```js
window.addEventListener("mousemove", function (event) {
  // Update the position of the cube.
  app.cube.position.x = event.clientX - ( app.width / 2 );
  app.cube.position.y = ( event.clientY - ( app.height / 2 ) ) * -1;
});
```

We will do something now to do some even funky stuff. This is called orbitControls and is a really common THREE.js addon.

Make sure you have the orbitControls file...

` curl https://raw.githubusercontent.com/mrdoob/three.js/master/examples/js/controls/OrbitControls.js > orbitControls.js `

Before you append the renderer, add the following lines... This allows us to control the camera a lot better - with the track pad etc.

```js
// Use an additional library to be able to control the camera.
app.controls = new THREE.OrbitControls( app.camera, app.renderer.domElement );
```

Notice that when we are making the page bigger and smaller, it doesn't update the size of the renderer or the element. We need to fix that and obviously it isn't as simple as using CSS.

```js
window.addEventListener("resize", function () {
  // Store the new width and height.
  app.width = window.innerWidth;
  app.height = window.innerHeight;

  // Change the camera's aspect ratio
  app.camera.aspect = app.width / app.height;
  // Update the way that it is representing things in the scene.
  app.camera.updateProjectionMatrix();

  // Set it's new size.
  app.renderer.setSize( app.width, app.height );
  // Rerender the size.
  app.renderer.render( app.scene, app.camera );
});
```

That should have some stuff working!

[Here is what the main.js file should look like.](https://gist.github.com/ga-wolf/9176d0d1538e63cf6d5f)