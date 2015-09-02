## Week 05, Day 03
### 02 / 09 / 2015

What we covered today:
- [Warmup](https://gist.github.com/ga-wolf/6608843f4c24acee04e9)
  + [Solution](https://github.com/ga-wolf/WDI10-Homework/blob/master/warmup-exercises/week_05/roman-numerals.rb)
- Demos
- Migrations
- Rails in the Terminal
- Form Helpers
- MOMA
- [Associations](http://guides.rubyonrails.org/association_basics.html)
  + has_many
  + belongs_to

#### The Power of Rails in Terminal

There are a few commands that are absolutely essential for Rails development. The more you know them, the better it is!

At its most basic:
- `rails new` - Generate a new application
- `rails server` - Runs the server
- `rails generate` - Generate a whole heap of things within an application
- `rails console` - Opens up a console
- `rails dbconsole` - Opens up a direct connection to SQL
- `rake` - Does thousands of things
- `bundle` - Install gems and their dependencies

Running any command with `-h` or `--help` at the end will show you the documentation for that particular command.  But the real power comes from...

**Customization and Automation!**

_RAILS NEW_

```ruby
rails new app_name
rails new app_name -T # Skips the Test Suite
rails new app_name --database=postgresql # Specifies the Database (changes it from sqlite3)
rails new app_name -d postgresql
```

_RAILS SERVER_

```ruby
rails server
rails s # Shorthand for rails server
rails server -p 3001 # Specifies another port (have multiple servers at once!)
rails server -e production # Changes the state of the application (different gem sets etc. - don't worry about this one)
```

_RAILS GENERATE_

```ruby
rails generate controller ControllerName list of actions
rails generate controller Greetings index create
rails g controller Greetings index create
# THIS WILL CREATE VIEWS, JS, CSS AND ACTIONS IN CONTROLLERS (PLUS TESTS)

rails g model ModelName field:type
rails g model Painting name:string year:date
# THIS WILL CREATE MODELS, MIGRATIONS, AND TESTS

rails g scaffold ModelName field:type field:type
rails generate scaffold Painting name:string year:date
# THIS WILL CREATE EVERYTHING
```

_RAILS CONSOLE_

```ruby
rails console # OPENS UP YOUR RAILS APP IN PRY OR IRB
rails c # SHORTHAND

rails console staging # OPENS UP A SPECIFIC ENVIRONMENT

rails console --sandbox # CAN'T MAKE ANY ACTUAL CHANGES
```

_RAILS DBCONSOLE_

```ruby
rails dbconsole # OPENS UP A DIRECT CONNECTION TO YOUR DATABAS
rails db # SHORTHAND
```

_BUNDLE_

```ruby
bundle install # INSTALLS GEM AND DEPENDENCIES
bundle # SHORTHAND
```

_RAKE_

This is crazy powerful and does a million things, but here are some of the more important ones that you might need to know.  We will go into this in a lot more detail though!

```ruby
rake --tasks # Lists everything it can do

rake about # Lists everything about your Rails app

rake db:drop # DROPS THE DATABASE
rake db:create # CREATES THE DATABASE
rake db:migrate # MIGRATES TABLES INTO THE DATABASE (FROM db/migrations)
rake db:rollback # GOES BACK ONE STEP IN THE DATABASE (BACK ONE MIGRATION)

rake routes # LIST ALL OF YOUR ROUTES

rake stats # LINES OF CODE ETC.

rake notes # SEE HERE - http://guides.rubyonrails.org/command_line.html#notes
```

#### Form Helpers

At its most basic...

```html
<%= form_tag("/search", method: "get") do %>
  <%= label_tag(:q, "Search for:") %>
  <%= text_field_tag(:q) %>
  <%= submit_tag("Search") %>
<% end %>
```

Binding a form to an object...

```ruby
# OUR CONTROLLER
def new
  @article = Article.new
end
```

```html
<!-- OUR ASSOCIATED VIEW -->

<%= form_for @article, url: {action: "create"}, html: {class: "nifty_form"} do |f| %>
  <%= f.text_field :title %>
  <%= f.text_area :body, size: "60x12" %>
  <%= f.submit "Create" %>
<% end %>
```

TAG HELPERS!

```html
<%= radio_button_tag(:age, "adult") %>
<%= label_tag(:age_adult, "I'm over 21") %>
<%= text_area_tag(:message, "Hi, nice site", size: "24x6") %>
<%= password_field_tag(:password) %>
<%= hidden_field_tag(:parent_id, "5") %>
<%= search_field(:user, :name) %>
<%= telephone_field(:user, :phone) %>
<%= date_field(:user, :born_on) %>
<%= datetime_field(:user, :meeting_time) %>
<%= datetime_local_field(:user, :graduation_day) %>
<%= month_field(:user, :birthday_month) %>
<%= week_field(:user, :birthday_week) %>
<%= url_field(:user, :homepage) %>
<%= email_field(:user, :address) %>
<%= color_field(:user, :favorite_color) %>
<%= time_field(:task, :started_at) %>
<%= number_field(:product, :price, in: 1.0..20.0, step: 0.5) %>
<%= range_field(:product, :discount, in: 1..100) %>
<%= select_tag(:city_id, '<option value="1">Lisbon</option>...') %>
<% cities_array = City.all.map { |city| [city.name, city.id] } %>
<%= options_for_select(cities_array) %>
<%= time_zone_select(:person, :time_zone) %>
<%= select_date Date.today, prefix: :start_date %>
```

Thousands of things you can do, go through [here!](http://guides.rubyonrails.org/form_helpers.html)


#### A Basic Rails Guide

- ` rails new app-name `
- ` cd app-name `
- Add ` gem 'pry-rails' ` into your Gemfile (in the development group)
- run ` bundle `
- run ` rake db:create `
- Generate your first migrations and models - either ` rails g model Model name:string type:string ` etc. or:
  + ` rails g migration create_tables `
  + Add the fields you need to that file - make sure you include t.timestamps
  + ` rails g model ModelName `
- Generate your controllers and your views - either ` rails g controller Users index new create delete show ` etc. or:
  + ` rails g controller Users `
  + Add your methods into the controller
  + Create views that correspond with the method names in the view folder for that particular controller
- Work out your routes file
- Repeat this stuff as necessary