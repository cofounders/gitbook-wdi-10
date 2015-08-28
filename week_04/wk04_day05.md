## Week 04, Day 05
### 28 / 08 / 2015

What we covered today:
- Talk from Lucy Bain
- Demos
- Object Oriented Programming
    + Objects
    + Classes
- Active Record

#### Object Oriented Programming (OOP)

_Brief Intro to OOP_

Basically, OOP is an approach to development that tries to replicate real life.  It is pretty much always done using objects or classes as namespaces and treats them as a way to make your code "modular".

Small, clean methods are also a major part of it.

_Basic OOP in Ruby_

Up until now, we have only been modifying objects.  We can create an empty one and then add methods and features to construct a particular one.

```ruby
o = {}
def o.silly_method
    puts "I'm silly!"
end
```

This is not ideal.  It means we always have to rewrite a whole bunch of code.

To get around this we use classes!

_Classes_

Everything in Ruby inherits from a class (is an instance of a class) and in some capacity inherit from Object.  This doesn't pop up that regularly, but to see what I mean...

```ruby
{}.class
[].class
"".class
# etc.

# If you want to see everything a data type inherits from...
{}.class.ancestors
[].class.ancestors
"".class.ancestors
```

Treat classes as a factory or a blueprint, something that gives another thing all the details that it needs.  We use them to stop duplicate code, make manageable, easy-to-debug code.

_What do they look like?_

```ruby
class Person
end
```

_The Real Power..._

...Comes from being able to add methods!  We can encapsulate functionality with classes.

```ruby
class Person
    def speak
    end

    def laugh
    end
end
```

Unlike javascript though, we can't call the functions or methods on the class itself.  This is how we could do it in javascript...

```js
var Person = {
    talk: function () {
        console.log( "I can talk!" );
    }
}

Person.talk();
```

In Ruby, we need to create an instance of the class. Think of the class itself being a blueprint, and the instance being the house that is built from it (it is the thing with all the power and functionality).

```ruby
class Person
    def speak
        puts "Speak"
    end

    def laugh
    end
end

person = Person.new
person.speak # Will work!
```

Obviously, though. We want to be able to store something on the person themselves! Maybe we want to know their name, age or gender for example.

We use what are called "getters" and "setters" to do this.

```ruby
class Person
    def name=(name)
        @name = name
    end

    def name
        @name
    end

    def age=(age)
        @age = age
    end

    def age
        @age
    end
end

person = Person.new
person.name=( "Jane" )
person.age=( 80 )

person.name # Will return "Jane"
person.age # Will return 80
```

Surely, you can all see the duplication though.  There must be an easier way!  There is.

```ruby
class Person
    attr_accessor :name, :age
end

person = Person.new
person.name = "Serge"
person.name # Will return "Serge"

person.age = 100
person.age # Will return 100
```

But it is a hassle to define each one of these like this.  We are lucky to have a solution for this.

On a creation of a new instance in Ruby, when the .new method is called, it will also call automatically an initialize method.

```ruby
class Person

    attr_accessor :name, :age

    def initialize( name, age )
        @name = name
        @age  = age
    end

end
```

This will do everything that we were doing before.

We can add heaps of methods and see what we have to work with as well.

```ruby
class Person
    def method_one
    end
    def method_two
    end
    def method_three
    end
end

person = Person.new

# To access all the methods:

person.class.instance_methods

# If you pass in the value false to the instance methods method, it will only show you the methods you have defined.

person.class.instance_methods( false )
```

#### Active Record

_Preface - Object Relational Mapping_

One of the most signifcant principles in Object-Oriented Programming is the idea of rich objects - things that store data, and allow it to be retrieved in logical and concise ways.  This pattern is what Active Record strives for.  They call it Object Relational Mapping, or ORM.  It's basic principle is that rich objects in your application should be connected with database tables.  Using ORM, the properties and relationships of the objects in an application can be easily stored and retrieved from a database without writing SQL statements directly and with less overall database access code.  Also is far more secure due to lessened risks in regards to SQL Injections.

_What does Active Record do?_

Active Record, as an ORM, gives us several mechanisms, the most important being the ability to:

- Represent models and their data.
- Represent associations between these models.
- Represent inheritance hierarchies through related models.
- Validate models before they get persisted to the database.
- Perform database operations in an object-oriented fashion.

_Convention over Configuration_

Convention over configuration is big in development anyway, but it is particularly full on when it comes to Active Record.  That is because it uses the names to sort out assosciations etc.  Make sure you follow these rules!!

- **Database Tables** - Plural with underscores seperating words (articles, line_items etc.)
- **Model / Class Names** - Singular with the first letter of each word capitalized (Article, LineItem etc.)

_How do you work with Active Record?_

Well, at the end of the day, Active Record is a gem like any other.  So we need to require it!!

```ruby
require 'active_record' # make sure this is at the top of the file!
```

After requiring it, we also need to actually establish the connection to the database.  These are annoying lines that will be done automatically in Rails!  Just copy and paste them.

```ruby
# Sets up our connection to the database.db we have created
ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => 'database.db'
)

ActiveRecord::Base.logger = Logger.new(STDERR) # Logs out the Active Record generated SQL in the terminal. This isn't necessary but very helpful and cool to see what it is actually running
```

#### Brief Interlude of Random Stuff

|        | SQL    | HTTP Verbs              | Active Record            |
|--------|--------|-------------------------|--------------------------|
| Create | INSERT | (Put) or POST           | .create or .new/.save    |
| Read   | SELECT | GET                     | .find or .find_by        |
| Update | UPDATE | (Patch) or POST         | .update or .find/.save   |
| Delete | DELETE | (Delete) or POST or GET | .destroy or .destroy_all |


##### CRUD with Active Record

Once we have our models defined (i.e. our classes), we can get into the CRUD stuff.  There are always a lot of options of how to do this!

_Create_

```ruby
plant = Plant.new
plant.name = "Hibiscus"
plant.flowers = true
plan.save # YOU MUST RUN THIS LINE! (When using the new approach)

# OR

plant.create( :name => "Hibiscus", :flowers => true )

# OR

user = User.new do |u|
  u.name = "David"
  u.occupation = "Code Artist"
end # THIS WILL RUN THE SAVE AUTOMATICALLY
```

_Read_

``` ruby
Plant.all
Plant.first
Plant.last
Plant.find( 10 ) # Find with an ID
Plant.find_by( :name => "Hibiscus" ) # Returns the first plant that this works with
Plant.where( :name => "Hibiscus" ) # Returns all instances where this is appropriate
```

_Update_

``` ruby
plant = Plant.find_by( :name => "Hibiscus" )
plant.name = "Hibiscus 2"
plant.save

plant = Plant.find_by( :name => 'Hibiscus 2' )
plant.update( :name => 'Hibiscus' ) # This will save automatically
```

_Delete_

``` ruby
plant = Plant.find_by( :name => 'Hibiscus' )
plant.destroy

Plant.destroy_all
```

For the basics of Active Record, [see here.](http://guides.rubyonrails.org/active_record_basics.html)

For more ways to query things with Active Record, [see here.](http://guides.rubyonrails.org/active_record_querying.html)
