## Week 08, Day 01
### 21 / 09 / 2015

What we covered today:
- [Warmup](https://gist.github.com/ga-wolf/37b832abe507aef812a3)
  + [Solution](https://github.com/ga-wolf/WDI10-Homework/tree/master/warmup-exercises/week_08/wordy_calculator_two)
- Backbone Structure
- Backbone App with API
- Burning Airlines Groups

#### Backbone

##### Structure

One of the main reasons to use Backbone is because of Seperation of Concerns.  But so far, we have kept everything in one file.  That is really not ideal!

The basic folder structure for any Backbone project...

```
|   YourJavascripts
        backbone.js
        underscore.js
        jQuery.js

        |   models
        |   collections
        |   views
        |   routers
```

So, we have folders for models, collections, views and routers.  By creating this broken up structure, we end up having small, concise files that do one thing (hopefully, well).

Another thing that is very common for working with Backbone in multiple files is using a global app object, something that encompasses all of our data.  There are lots of reasons for doing this, but stopping pollution of the global namespace (not having heaps of variables visible) is a big one, also reducing the change for errors. To do this, there are three things we need to do.

First off, you need to have this line at the top of each file:

```
var app = app || {};
```

That says uses the or operator to act as a way of providing a default. If app is defined, it will just use that, otherwise it will be defined as an empty object.

Secondly, you need to scope all of your variables. It may end up looking something like this:

```js
var app = app || {};

app.Posts = Backbone.Collection.extend({}); // for example
app.Post = Backbone.Model.extend({}); // another example
```

And finally, you need to work with the way that files are required.  The order normally is:

- Libraries (jQuery, then Underscore, then Backbone)
- All of your models
- All of your collections
- All of your views
- Your router
- The main app file

#### Backbone and Rails - The Really Important things

Backbone works really well with Rails, but does rely heavily on a RESTful API - which Rails all but enforces.

Let's create an application! ` rails new backboneblog-rails `

Because Rails handles the requiring of all our javascript files, we need to customize our application.js file to work with the correct order.

```
//= require jquery
//= require jquery_ujs
//= require underscore
//= require backbone
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./views
//= require_tree ./routers
//= require_tree .
```

The next thing we encounter is the fact that ERB uses the same style of interpolation as underscore does in the interpolation of templates, so we need to customize them:

```js
_.templateSettings = {
    evaluate : /\{\[([\s\S]+?)\]\}/g,     // {[ console.log("Hello"); ]} - runs code (for if statements, loops etc.)
    interpolate : /\{\{([\s\S]+?)\}\}/g   // {{ key }} - interpolates
};
```

After we have customized a bunch of these things to make sure it all works, it is time for us to actually create a database and create a post model.

```
rails generate scaffold Posts content:text title:text
rake db:migrate
```

Now, we have a fully functioning posts database table to work with! Start up the server and create a few posts to work with (this should be on localhost:3000/posts/new).

There are a bunch of functions that allow us to interact with the server, but they won't work until we actually provide the URLs, so let's go ahead and do that.

```js
app.Post = Backbone.Model.extend({
    urlRoot: "/posts",
    defaults: {
        title: "Hello World",
        content: "I exist"
    }
});

app.Posts = Backbone.Collection.extend({
    url: "/posts",
    model: app.Post
});
```

The really important things in here are:

- You must provide a ` urlRoot ` to a model, that specifies the base RESTful route to use
- You must provide a ` url ` to a collection, which specifies the base RESTful route to use

Now that we have specified those things, we can start to use all of the useful functionality that Backbone offers.

Some of the methods that Backbone provides on models are:

- save
- fetch
- destroy

Some of the methods that Backbone provides on collections are:

- create
- fetch
- sync

But before we go ahead and do that, let's create an application from scratch!

#### Backbone and Rails - A Full Tutorial with Secrets

- Create the app - ` rails new secrets-app `
- Move into the app directory - ` cd secrets-app `
- Create a scaffold for individual secrets - ` rails generate scaffold Secret content:text `
- Run the migration - ` rake db:migrate `
- Let's create some secrets, so start up the server and visit ` localhost:3000 `
- Once that is done, let's add some stuff into the config/routes.rb file.  We just want to add a custom root. ` root :to => 'secrets#home' ` or ` root 'secrets#home' `
- That will fail, because we haven't added that action. Add a home method in the app/controllers/secrets_controller.rb
    ```rb
    def home
    end
    ```
- That will now complain about the view not existing, so let's create our file. ` touch app/views/secrets/home.html.erb `
- Let's navigate to the javascripts folder - ` cd app/assets/javascripts `
- It is now time to create our folder structure...  ` mkdir models collections views routers `
- We then need to download Backbone and Underscore and add a main javascript file
    + curl https://cdnjs.cloudflare.com/ajax/libs/backbone.js/1.2.3/backbone-min.js > backbone.js
    + curl https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore-min.js > underscore.js
    + touch main.js
- We also need to alter our application.js file so that it requires files in the correct order, it needs to look somewhat like this:
    ```
    //= require jquery
    //= require jquery_ujs
    //= require underscore
    //= require backbone
    //= require_tree ./models
    //= require_tree ./collections
    //= require_tree ./views
    //= require_tree ./routers
    //= require_tree .
    ```
- Let's start doing some work in the main.js file (our main file)
    ```js
    var app = app || {};

    _.templateSettings = {
        evaluate : /\{\[([\s\S]+?)\]\}/g,
        interpolate : /\{\{([\s\S]+?)\}\}/g
    };
    ```
- We then get start creating our models, so touch a secret.js file in the app/assets/javascripts/models folder - ` touch models/Secret.js `
    ```js
    var app = app || {};

    app.Secret = Backbone.Model.extend({
        urlRoot: "/secrets",
        defaults: {
            content: ""
        }
    });
    ```
- Test that that has worked by trying this in the console of the browser - ` var secret = new app.Secret({ content: "Hello World." }); `
- Now we want to have a collection of secrets, so make a secrets.js file in the collections folder - ` touch collections/Secrets.js `. In there, put the following code:
    ```js
    var app = app || {};

    app.Secrets = Backbone.Collection.extend({
        url: "/secrets",
        model: app.Secret
    });
    ```
- Let's test that that has worked. Try running this in the console - ` var secrets = new app.Secrets(); `, then run ` secrets.fetch() `.  If there are no errors, then we are all good!
- It's time to move onto the Router, ` touch routers/AppRouter.js `. And let's put some code in there!
    ```js
    var app = app || {};

    app.AppRouter = Backbone.Router.extend({
        routes: {
            '': 'index'
        },

        index: function () {
            console.log( "You have reached the index." );
        }
    });
    ```
- That won't work because we never have started up the router, so let's do that. Open up the main.js file and put this at the bottom:
    ```js
    $(document).ready( function () {
        app.secrets = new app.Secrets();
        app.secrets.fetch().done(function () {
            app.router = new app.AppRouter();
            Backbone.history.start();
        });
    });
    ```
- There are lots of things going on in there, so let's have a look at it
    + ` app.secrets = new app.Secrets(); ` - creates a new instance of our Secrets collection
    + Get them all from the url defined, and once that is done:
    + Create a new instance of the router
    + And get Backbone to start listening to the urls
- We now need to create our view to render our app. ` touch views/AppView.js ` - Put the following stuff inside there:
    ```js
    var app = app || {};

    app.AppView = Backbone.View.extend({
        el: '#main',
        render: function () {
            var appViewTemplate = $("#appViewTemplate").html();
            this.$el.html( appViewTemplate );
        }
    });
    ```
- Because we are referencing the element with an ID of main, we better to add that element into the home.html.erb file (in app/views/secrets).  We also want to add our templates
    ```html
    <div id="main"></div>

    <script id="appViewTemplate" type="template/underscore">
        <h1>Secrets</h1>
        <div id="secretForm">textarea view goes here</div>

        <ul id="secrets">
            <li>Secrets go here as list items</li>
        </ul>
    </script>
    ```
- Now that we have created our elements, in the Backbone router that we created, put the following code in the index function:
    ```js
    var appView = new app.AppView({ collection: app.secrets });
    appView.render();
    ```
- Let's go ahead and create an individual secret view. So make a file called SecretView.js in app/assets/javascripts/views. It's going to look something like this:
    ```
    app.SecretView = Backbone.View.extend({
        tagName: "li",
        render: function () {
            this.$el.text( this.model.get('content') );
            this.$el.prependTo( '#secrets' );
        }
    });
    ```
- And then we need to actually render the individual secrets using that view.  So let's make the AppView's render function look like this:
    ```
    render: function () {
        var appViewTemplate = $("#appViewTemplate").html();
        this.$el.html( appViewTemplate );

        var secretInput = new app.SecretInputView();
        secretInput.render();

        this.collection.each(function (secret) {
            var secretView = new app.SecretView({ model: secret });
            secretView.render()
        })
    }
    ```
- We now want to put a way to create secrets, so let's make a SecretInputView - make a file called SecretInputView.js in the app/assets/javascripts/views folder. It's going to look like this:
    ```js
    var app = app || {};

    app.SecretInputView = Backbone.View.extend({
        el: "#secretView",
        render: function () {
            var secretInputViewTemplate = $("#secretInputViewTemplate").html();
            this.$el.html( secretInputViewTemplate );
            this.$el.find('textarea').focus();
        }
    });
    ```
- But we don't have that template, so put this in your home.html.erb
    ```
    <script id="secretInputViewTemplate" type="template/underscore">
        <textarea placeholder="Tell me all your secrets"></textarea>
        <button>Submit</button>
    </script>
    ```
- We want this last view to do a bunch of work, so let's have a look at that:
    ```js
    var app = app || {};

    app.SecretInputView = Backbone.View.extend({
        el: "#secretView",
        events: {
            'click button' : 'createSecret'
        },
        render: function () {
            var secretInputViewTemplate = $("#secretInputViewTemplate").html();
            this.$el.html( secretInputViewTemplate );
            this.$el.find('textarea').focus();
        },
        createSecret: function () {
            var secret = new app.Secret();
            secret.set("content", this.$el.find('textarea').val() );
            secret.save();

            app.secrets.add( secret );
        }
    });
    ```
- Finally, for the sake of this tutorial, let's add this into the initialize method of your collection ( Secrets.js in app/assets/javascripts/collections )
    ```js
    this.on('add', function (secret) {
       var secretView = new app.SecretView({model: secret});
       secretView.render();
    });
    ```

There are lots of things going on in here, and [here is the project in it's entirety.](https://github.com/wofockham/wdi-10/tree/master/11-backbone/backboneblog-rails)  Well worth going through that link as we didn't write every line of code in this tutorial.