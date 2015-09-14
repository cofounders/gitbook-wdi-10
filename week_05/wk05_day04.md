## Week 05, Day 04
### 03 / 09 / 2015

What we covered today:
- Install PostgreSQL
- TUNR
    + Has and Belongs to Many
    + Has Many Through
    + HAML
    + Authentication
    + Validations

#### PostgreSQL Installation

First things first.  Download the application from [here.](http://postgresapp.com/)  Once the download is complete, double click the ZIP file and run through the installation.  Make sure you drag the Postgres.app file into your Applications folder!

After that, open up the Postgres.app, you will know that it has worked when you see an elephant in the top bar of your computer.

Now, this is the more difficult bit.  Open up your .bash_profile with Sublime - ` subl ~/.bash_profile ` should do the trick, and copy this line of code into there ` export PATH:$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin ` .  Save that file and open up a new terminal window.  If typing ` postgres ` doesn't throw an undefined error, you are all good!

Remember that we should always use PostgreSQL for your Rails applications, it is far more scalable, pretty much just as easy to set up and works on Heroku (where we will be hosting our applications).  To start a Rails application with postgres - ` rails new app_name --database=postgresql ` or ` rails new app_name -d postgresql ` - should do the trick.

#### Working with Rails and PostgreSQL

Create your application - ` rails new app_name -d postgresql `

Find out your username with ` whoami `

Open up your database.yml file and add the following lines into the development bit...

```yml
host: localhost
username: the_result_of_the_whoami_command
```

Now run ` rake db:create `

You can get into your migrations now!

To check that your migrations have worked, run ` rails dbconsole ` or ` rails db `, and then type in ` \d table_name; ` ( eg. ` \d songs; ` ).  This will show you the schema for it.

` \q ` - will exit the dbconsole!

Then run ` annotate `

#### Associations!

We need associations to make common tasks easier and more readable.  In Rails, an association is a connection between two models that inherit from ActiveRecord::Base ( called Active Record models for understandable reasons ).  There are six types of associations and we will briefly look at them now.

- belongs_to
- has_one
- has_many
- has_many :through
- has_one :through
- has_and_belongs_to_many

For a far deeper dive though, [see here.](http://guides.rubyonrails.org/association_basics.html)

_Belongs To_

A belongs_to association sets up a one-to-one connection with another model, such that each instance of the declaring model "belongs to" one instance of the other model.  This is often used in conjunction with has_one or has_many.  Remember that belongs_to associations must be in the singular term!

```ruby
class Order < ActiveRecord::Base
    belongs_to :customer
end
```

_Has One_

A has_one association also sets up a one-to-one connection with another model, but with somewhat different semantics (and consequences). This association indicates that each instance of a model contains or possesses one instance of another model.

```ruby
class User < ActiveRecord::Base
  has_one :account
end
```

_Has Many_

A has_many association indicates a one-to-many connection with another model. You'll often find this association on the "other side" of a belongs_to association. This association indicates that each instance of the model has zero or more instances of another model.  Note that the name of the other model is pluralized when declaring a has_many association.

```ruby
class User < ActiveRecord::Base
  has_many :orders
end
```

_Has Many Through_

A has_many :through association is often used to set up a many-to-many connection with another model. This association indicates that the declaring model can be matched with zero or more instances of another model by proceeding through a third model.

```ruby
class Doctor < ActiveRecord::Base
  has_many :appointments
  has_many :patients, through: :appointments
end

class Appointment < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient
end

class Patient < ActiveRecord::Base
  has_many :appointments
  has_many :doctors, through: :appointments
end
```

_Has One Through_

A has_one :through association sets up a one-to-one connection with another model. This association indicates that the declaring model can be matched with one instance of another model by proceeding through a third model.

```ruby
class Supplier < ActiveRecord::Base
  has_one :account
  has_one :account_history, through: :account
end

class Account < ActiveRecord::Base
  belongs_to :supplier
  has_one :account_history
end

class AccountHistory < ActiveRecord::Base
  belongs_to :account
end
```

_Has And Belongs To Many_

A has_and_belongs_to_many association creates a direct many-to-many connection with another model, with no intervening model.

```ruby
class Assembly < ActiveRecord::Base
  has_and_belongs_to_many :parts
end

class Part < ActiveRecord::Base
  has_and_belongs_to_many :assemblies
end
```

#### HAML

_What is it?_

Stands for Hypertext Abstraction Markup Language, but, put simply, it is shorthand for making HTML.  It is an indentation based compiler.  Its focus is cleanliness, readability, and production speed.

It's a bit difficult to get your head around at first, and is quite picky when it comes to indentation etc.

_How to use it?_

In HAML, to specify an element we write the percent sign and then name of the tag.  It works for any tag.  If, after the element name, we write an equals sign - it tells the compiler to evaluate the Ruby code and the print out the return value.  For loops etc., there is no need for end statement.

```haml
/ This is the HTML
/ <strong><%= item.title %></strong>

/ The HAML equivalent
%strong= item.title

/ To add classes and ids

%strong.class_name#id_name

/ To add other attributes, use a normal Ruby hash
%strong{ :class => "class_name", :id => "id_name" }

/ We can interpolate variables into here as well
%strong{ :class => "class_name", :id => "id_name#{ item.id }" }

/ This is how nesting works
#content
  .left.column
    %h2 Welcome to our site!
    %p= print_information
  .right.column
    = render :partial => "sidebar"

/ For each loops etc.
- ( 0..9 ).each do |i|
  %p= i
```

See [here](http://haml.info/docs/yardoc/file.REFERENCE.html) for more information.

#### Authentications!

Authentication is rough, and rarely (if ever) will you be asked to do it for yourself.  There are plenty of gems that will do that sort of thing, but if you want to do it for yourself - there are a bunch of things you need to do.

First things first, we don't store passwords in plain text, we store it in something called a password_digest.  This is something that has been encrypted.

Let's create our User model!!

```ruby
rails generate model User name:string password_digest:string age:integer email:string
# That will create our model and our migrations

rake db:migrate # This will create our User model
```

Now, we need to use our Gemfile to get something that does the encrypting. We normally use [bcrypt](https://github.com/codahale/bcrypt-ruby) for this.  Let's add it!

```ruby
gem 'bcrypt'
```

In our User model, we need to add the following line.  Make sure it goes before the end!

```ruby
has_secure_password
```

In our forms, we still need to do reference :password and :password_confirmation.  But it will sort everything out behind the scenes for us!

[This](https://gist.github.com/thebucknerlife/10090014) is quite a good description!
