## Week 07, Day 04
### 17 / 09 / 2015

What we covered today:
- [Warmup](https://gist.github.com/ga-wolf/803859779907e3ad84d6)
  + [Solution](https://github.com/ga-wolf/WDI10-Homework/blob/master/warmup-exercises/week_07/wordy_calculator_one/wordy.rb)
- Demos
- Backbone Blog

#### Backbone Blog

##### An Approach for Building Backbone Apps

- Lots and lots of thinking
- Create a basic HTML page
    ```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Basic Backbone App Structure</title>
</head>
<body>

    <div id="main"></div>

    <!-- OTHER SCRIPTS. -->
    <!-- jQuery from cdnjs.com -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- underscore.js from cdnjs.com -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore-min.js"></script>
    <!-- backbone.js from cdnjs.com -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/backbone.js/1.2.1/backbone-min.js"></script>

    <!-- Your Scripts Here -->
    <script src="js/main.js"></script>
</body>
</html>
    ```
- Referencing all of your files
- Create the router blueprint

    ```js
var AppRouter = Backbone.Router.extend( {
    routes: {
        "" : "index"
    },
    // Any functions required for the routes
    index: function () {

    }
} );
    ```
- Create a new instance of the AppRouter constructor, and tell it to start listening.  Make sure you don't do this until the document has loaded!

    ```js

var router;
$( document ).ready( function () {
    router = new AppRouter(); // Creates a new instance
    Backbone.history.start(); // Tells it to start listening
} );
    ```
- Decide what you want in each view.  Let's pretend we are working with the index page
- We want that to show the intro page, so we are going to create an AppView and then render it.
- Create your main view, give it an el, an initialize method, and a render method. Make sure in the render method that you save a reference to the view.
    ```js
var AppView = Backbone.View.extend( {
    el : "#main",
    initialize: function () {  },

    render: function () {
        var view = this;
        var $welcomeText = $( "<h1 />" ).text( "Welcome to our App" );
        view.$el.html( $welcomeText );
    }
} );

    ```
- Actually create an instance of that view in the Router blueprint (AppView)
    ```js
var AppRouter = Backbone.Router.extend( {
    routes: {
        "" : "index",
        "posts/:id" : "showPost"
    },
    // Any functions required for the routes
    index: function () {
        var appView = new AppView();
        appView.render(); // Have this written ready to pass in a collection if necessary
    },

    showPost: function ( id ) {
        var post = blogPosts.get( id );
        var postView = new PostView( { model : post } );
        postView.render();
    }
} );
    ```
- Let's work with templates though, so let's make some of them
    ```html
<script id="appTemplate" type="text/template">
    <h1>Welcome to our Application</h1>
    ul.posts
</script>
    ```
- Change the render function on the AppView to use the template
    ```js
render: function () {
    var view = this;
    var $welcomePageHTML = $( "#appTemplate" ).html();
    view.$el.html( $welcomePageHTML );
}

    ```
- Now define your main model and give it some default values (if necessary)
    ```js
var Post = Backbone.Model.extend( {
    defaults : {
        title   : "Untitled Post",
        content : "Untitled Post Content"
    }
} );
    ```
- Create your collection - passing the appropriate model
    ```js
var Posts = Backbone.Collection.extend( {
    model : Post
} );
    ```
- Create some sample data (models that are given to the collection) to make sure that it all has worked.
    ```js
var blogPosts = new Posts([
    new Post( { id: 1, title: "Post 1", content: "Post 1 Content" } ),
    new Post( { id: 2, title: "Post 2", content: "Post 2 Content" } ),
    new Post( { id: 3, title: "Post 3", content: "Post 3 Content" } ),
]);
    ```
- Check that all the connections have worked!!
    ```js
console.log( "Blog Posts object: ", blogPosts );
console.log( "Blog Posts length: ", blogPosts.length );
console.log( "Models in our blogPosts collection: ", blogPosts.models );
    ```
- Change the index function to show all the dummy data
    ```js
var AppView = Backbone.View.extend( {
    el : "#main",
    initialize: function () {  },
    render: function () {
        var view = this;
        var appHTML = $( "#appTemplate" ).html();
        view.collection.each( function ( post ) {
            console.log( post.toJSON() );
        } );
    }
} );
    ```
- Change the creation and render of this particular view to pass in a collection
    ```js
var appView = new AppView( { collection : blogPosts } );
appView.render();
    ```
- Create smaller views if necessary (more localised - for one post for example)
    ```js
var PostListView = Backbone.View.extend( {
    tagName : "li",
    render: function () {
        console.log( "The model passed in - ", this.model.toJSON() );
    }
} );
    ```
- Change the appView render to create new instances of this PostListView
    ```js
render: function () {
    var view = this;
    var appHTML = $( "#appTemplate" ).html();
    view.collection.each( function ( post ) {
        var postListView = new PostListView( { model: post } );
        // Create a new instance of PostListView, passing in a model
        postListView.render()
    } );
}
    ```
- Now that we are going to want interpolation with the templating stuff, let's add a different style of interpolation (using curly brackets) to underscore templates by adding this code at the very top of the file
    ```js
_.templateSettings = {
      evaluate : /\{\[([\s\S]+?)\]\}/g,     // {[ console.log("Hello"); ]} - runs
      interpolate : /\{\{([\s\S]+?)\}\}/g   // {{ key }} - interpolates
};
    ```
- And let's create our template, remembering to put it at the bottom of the HTML page in script tags with a type of "text/template"
    ```html
<script class="#postListTemplate" type="text/template">
    <h3>{{ title }}</h3>
    <p>{{ content }}</p>
</script>
    ```
- In our PostListView render function, we need to actually use this template to work our stuff
    ```js
render: function () {
    var postListTemplate = $( "#postListTemplate" ).html();
    var postListHTML = _.template( postListTemplate );
    this.$el.html(  postListHTML( this.model.toJSON() ) );
}
    ```
- Now we need to give some events to our PostListView
    ```js
var PostListView = Backbone.View.extend( {
    events: {
        "click" : "showPost"
    },
    showPost: function () {
        router.navigate( "posts/" + this.model.get("id"), true ); // Change URL with Backbone to posts/:id
    }
} )
    ```
- We actually need to listen for this URL.  Add a few things to your Router!
    ```js
var AppRouter = Backbone.Router.extend( {
    routes: {
        "" : "index",
        "posts/:id" : "showPost"
    },
    // Any functions required for the routes
    index: function () {
        var appView = new AppView();
        appView.render(); // Have this written ready to pass in a collection if necessary
    },

    showPost: function ( id ) {
        var post = blogPosts.get( id );
        var postView = new PostView( { model : post } );
        postView.render();
    }
} );
    ```
- We have said that we need to render a postView, lets create it!
    ```js
var PostView = Backbone.View.extend( {
    el: "#main",
    render: function () {
        var postTemplate = $( "#postTemplate" ).html();
        var postHTML = _.template( postTemplate );
        this.$el.html( postHTML( this.model.toJSON() ) );
    }
} );
    ```


#### Must Haves in Backbone

- Backbone.View.extend({ });
    + el
    + initialize (maybe)
    + render
- Backbone.Collection.extend({ });
    + model
    + initialize (maybe)
- Backbone.Model.extend({  });
    + defaults (maybe)
    + initialize
    + watchers - change etc.