## Week 05, Day 01
### 01 / 09 / 2015

What we covered today:
- [Scrabble Warmup](https://gist.github.com/ga-wolf/fbff853f275b5d094eca)
    + [Solution](https://github.com/ga-wolf/WDI10-Homework/blob/master/warmup-exercises/week_05/scrabble.rb)
- Demos
- Rails
    + Intro

#### Rails

**History of Rails**

David Heinemeier Hansson extracted Ruby on Rails from his work on the project management tool Basecamp at the web application company also called Basecamp.  He released it as open source in July 2004 (but didn't give out commit rights until February 2005).

Obviously there is heaps more, [see here for it](http://en.wikipedia.org/wiki/Ruby_on_Rails)

**What is it?**

Rails is a web application framework, built with Ruby.  It's a similar approach to a Javascript library with Javascript itself.  It is designed to make programming all web applications much, much easier by making lots of assumptions about what you are going to need to get started.  It means you have to write a lot less code, while building a lot more.  Similar to Ruby, it makes development fun.

Rails is very opinionated (the same as its creator), it makes an assumption there is a 'best' way to do it, and it encourages that way (but still allows for flexibility).  If you follow the 'Rails Way', it will be much easier.

The Rails philosophy includes three major guiding principles, which really just stem from Ruby itself (except the MVC pattern):

- _Don't Repeat Yourself (D.R.Y)_ - DRY is a principle of software development, not exclusive to Ruby (though Ruby is very good at it, as is its community).  It's main thing is that "Every piece of knowledge must have a single, unambiguous, authoritative representation within a system".  That makes it sound a lot more complex than it really is.  All it means is that by not writing the same code over and over again, our code is more maintable, extensible and less buggy.
- _Convention Over Configuration (C.O.C)_ - Rails, as previously mentioned, is very opinionated.  If you don't follow its guidelines (naming conventions etc.), it is difficult.  But if you do, the set up is very efficient.  It has the capacity to do most things by default as long as you follow the right approach.
- _Model, View and Controller (M.V.C)_ - This is probably the most important.  Rails structures everything like this, so it is important to understand this.  MVC is a software architecture pattern that breaks the code into small manageable chunks and stems from the problem when trying to modularize a user interface functionality so that it is maintanable and extensible.  Those chunks are Models, Views and Controllers as you have probably guessed.  But what are they?
    + Models - The model manages the behavior and data of the application domain, also where the database classes are created.
    + Views - The view manages the display of information.
    + Controllers - The controller interprets the user behaviour ( it is like the switchboard )
    + An easy way to understand MVC: the model is the data, the view is the window on the screen, and the controller is the glue between the two. -- [ConnellyBarnes](http://www.connellybarnes.com/work/)
    + But is all about the interactions.  A controller can send commands to the model to update the model's state (e.g., editing a document). It can also send commands to the associated view to change the presentation (and content). A model stores data that is retrieved by the controller and displayed in the view. Whenever there is a change to the data it is updated by the controller. A view requests information from the model that it uses to generate an output representation to the user.

**How to install it?**

Simple! `gem install rails`, make sure you don't add sudo at the start!  Obviously this needs to have Ruby as well, if you don't have that - see [here.(../week_04/wk04_day01.md).  It takes a long time to load everything in Rails.

**Let's create a new Rails project**

First step is always planning, before you get into a Rails project - it is very important to map out the way that a user will be using your site. Once you have figured that out, you can begin creating the project.

To create the Rails project, we use the `rails new project_name` command in terminal.  This takes a lot of options but for now we will just stick with that.  We need to then move into our project ( `cd project_name` ).

After this, we alter our Gemfile to be more suited for debugging.  The code we tend to use is this...

```ruby
group :development do
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'annotate'
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
end
```

We then run `bundle` in our terminal, that will sort out all our gems and get all the dependencies loaded which is quite important.  The Gemfile is a more complex and extensible way of doing requires at the top of a Sinatra app.

Now we get into the Routes (found in config/routes.rb).  This is like our phone directory or the 'gets' in Sinatra.  There are a million different ways of approaching this.  But at its most basic it will look something like the following.

```ruby
Rails.application.routes.draw do
            # controller#method
  root :to => 'pages#home'
    # route      controller#home
  get '/home' => 'pages#home'

  # DYNAMIC ROUTES WITH VARIABLE BITS IN PARAMS (JUST LIKE SINATRA)
  get '/auto/:color' => 'auto#color'
end
```

Lets load up the server - `rails server` or `rails s`.  If we go to `localhost:3000`, you can see an error.  We are up to an Error Driven Development point now, so if we load the root page (which is pages#home), we let the errors guide where we go next.

It will first say that there is an uninitialized Constant.  This means that we haven't created the associated controller.  In our routes, for our root page we have said that it wants "pages#home".  This says we need a Pages Controller and a home method within it.  So within the app/controller folder, we need to create a file called pages_controller.rb.  All our controllers inherit from ApplicationController - this is what gives it all of its functionality.  Within the PagesController, at its most basic, it is going to look something like this...

```ruby
class PagesController < ApplicationController
    def home
    end
end
```

Once we have this setup, we can need to create our views (the error is missing template).  We need to create a pages folder in our app/views folder, and within that we need a home.html.erb.  Once we have that, it will be required by default for us through the method (that's why naming conventions are so important with Rails).

This is the sort of setup you need to go through for each particular page in your application (there are many ways to generate them automatically though).  Obviously, you can do it a million times if necessary!

_The Basic Order of Things (without a database)_

- Planning
- `rails new project_name`
- Edit Gemfile for debugging
- Work out your routes - config/routes.rb
- Create controllers
- Create methods in controllers
- Create appropriate views
- Repeat as necessary
