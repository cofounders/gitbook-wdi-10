## Week 05, Day 02
### 02 / 09 / 2015

What we covered today:
- [Robot Name Warmup](https://gist.github.com/avenoir/e7187f0b7605660c9fe4)
  + [Solution](https://github.com/ga-wolf/WDI10-Homework/blob/master/warmup-exercises/week_05/robot-name.rb)
- Demos
- Rails
  + Naming Conventions
  + Helpers
  + CRUD
  + Planets

**Naming Conventions**

Models are singular, with a capitalized class name, located in app/models, have an extension of .rb, and inherit from ActiveRecord::Base.

Controllers are plural, with a CamelCase class name, located in app/controllers, have an extension of .rb, and inherit from ApplicationController.

Views are a bit more difficult. They reside in a folder in app/views, the name of that folder comes from the associated controller and is plural.  The name of the actual file is the name of the associated action (or method), plus .html.erb.  They don't inherit from anything. This may make things clearer...


| Type        | File Name              | Location          | Class Name        | Inherits From         |
| ----------- | ---------------------- | ----------------- | ----------------- | --------------------- |
| Model       | planet.rb              | app/models        | Planet            | ActiveRecord::Base    |
| Controllers | planets_controller.rb  | app/controllers   | PlanetsController | ApplicationController |
| Views       | index.html.erb         | app/views/planets | N/A               | N/A                   |


#### Helpers

These are things that you should use over and over, it is a collection of commonly used patterns.  They can only be used in our views!!!  Remember that these obviously need to be wrapped in ERB tags.

_Number Helpers_

```ruby
number_to_currency( value )
number_to_human( value )
number_to_phone( value, options )
number_to_phone( value, :area_code => true )
```

[Here are all of the number helpers.](http://api.rubyonrails.org/classes/ActionView/Helpers/NumberHelper.html)

_Text Helpers_

```ruby
pluralize( value, 'singular_case' )
pluralize( @person_count, 'person' )

truncate( value, options )
truncate( @story, :length => 50 )

cycle( list_of_values )
cycle( 'red', 'green', 'orange', 'purple' )
```

[Here are all of the text helpers.](http://api.rubyonrails.org/classes/ActionView/Helpers/TextHelper.html)

_Assets Helpers_

```ruby
image_tag( 'path', options )
image_tag( 'funny.jpg' )
image_tag( 'http://fillmurray.com/500/500', :class => "oh-bill" )
```

[Here are all of the asset helpers.](http://api.rubyonrails.org/classes/ActionView/Helpers/AssetUrlHelper.html)

_URL Helpers_

```ruby
link_to( 'Home', root_path )
link_to( 'Work Path Show', work_path( work.id ) )
link_to( 'Work Path Show', work_path( work ) )
link_to( 'Work Path Show', work )
button_to( 'Test Path', root_path, :method => 'GET' )
```

[Here are all of the url helpers.](http://api.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html)
