## Week 04, Day 04
### 21 / 05 / 2015

What we covered today:
- [Warmup](https://gist.github.com/ga-wolf/2490e4614ed1ac530d60) (Sorry!)
    + [Solution](https://github.com/ga-wolf/WDI10-Homework/blob/master/warmup-exercises/week_04/sieve/main.js)
- MTA Demos
- How does the web work?
- Web Servers
- Sinatra

#### Sinatra

_What is it?_

Sinatra is a **D**omain **S**pecific **L**anguage (DSL).  That doesn't mean that much, but more or less Sinatra is a web application framework - it is a gem (or library) that we include to give us the methods that we need to be able to construct simple web applications (with minimal effort apparently).

_How do we use it?_

It is a gem like anything else!!  We need two gems for this though - we have ` sinatra`  itself (which gives us all of those necessary methods), and we have `sinatra-contrib` - which is anything worthy that has been contributed to the Sinatra gem.  This is what includes the live reloader etc.

Run these two lines first!

```sh
gem install sinatra
gem install sinatra-contrib
```

For a basic Sinatra application, we don't need that much.  We just need to require the necessary gems.  We call the main Sinatra file `main.rb`.

```ruby
require 'sinatra'           # Gets sinatra itself
require 'sinatra/reloader'  # Live reloader from sinatra-contrib
```

This is all that is required to technically run the server (but it won't do anything or respond to anything).

To run the server, we just use to ruby to run the file - `ruby main.rb`.  Normally this will run a server at localhost:4567.

##### Routes

In Sinatra, a route is an HTTP method paired with a URL matching pattern.  Each one is linked to a block.

```ruby
get '/' do
    "This is a get request to the root path - visited at localhost:4567/"
end

get '/anything' do
    "This is a get request - visited at localhost:4567/anything" # This is returned as a response
end
```

Routes are matched in the order they are defined. The first route that matches the request is invoked.

These are literal matches.  We actually have to visit `/anything`, this is annoying because we don't always not what we are going to receive.

The way we solve this is by using named parameters.  Whatever is matched by the thing prefixed with the colon is stored in the params hash (which is automatically generated for us).

```ruby
get '/hello/:name' do
  # matches "/hello/foo" or "/hello/bar" or anything else that starts with "/hello/""
  # params['name'] might be 'foo' or 'bar'

  "Hello #{ params['name'] }!"
end
```

##### Views / Templates

At this point, we are just rendering a piece of text to the page - that isn't ideal.  We want it to be well presented!!  In its most basic form, we use ERB (embedded ruby).

ERB is very smart, but requires a particular setup.  For it to work, we need a `views` folder.  This is where all of our HTML (stored as ERB) will go.

The first thing we always do is create a `layout.erb` file.  This will be used by default everytime Sinatra sees the erb command.  This is where all of the stuff that you want to be on every page should go.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Our Basic Sinatra App</title>
</head>
<body>
    <nav>
        <ul>
            <li>Home</li>
            <li>About</li>
            <li>Gallery</li>
            <li>Contact</li>
        </ul>
    </nav>

</body>
</html>
```

It might look something like that.  This will get loaded regardless of what we want though.

If you imagine a blog situation, you might want a navigation that is on every page - this goes on the layout.erb page.  But you might also want to show the actual post as well.  This is what ERB is great at!  You pass in a symbol (the name of the file you'd like to load in) to the ERB method and it goes and grabs it for you.

```ruby
get '/post' do
    erb :post
end
```

If you just did this though, it would get the file but wouldn't know where to put the contents of that particular file in the layout!  As such, it will only show the layout.erb file.  We use the yield method to solve this problem!  This grabs the contents of the file requested and puts it straight over itself.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>

    <%= yield %>

</body>
</html>

```

For more information about Sinatra, see [here.](http://www.sinatrarb.com/intro.html)

[Here is your homework!](https://gist.github.com/wofockham/1f3821464656bf2fb253)