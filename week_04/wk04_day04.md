## Week 04, Day 04
### 27 / 08 / 2015

What we covered today:
- Warmup
    + Solution
- Demos
- File I/O (File Input / Output)
- SQL (Specific Query Language)
- CRUD
- Butterfly Lab

#### File Input / Output

Ruby is quite good at reading and writing to files.  This doesn't come up that regularly but it is definitely worth understanding.

There are a bunch of things you need to do to get into this file stuff.

- Open up a new instance of the File class with a specified mode (we will get into this soon)
- Puts stuff into it (yes! We can just use puts and prints)
- Close of the instance (Ruby can only open up 1000 connections to files and databases - you need to close every time!)
- Open the file up again (by creating a new instance of the File class)
- Read it line by line

Let's have a look at an example!  We have a basic person class...

```ruby
class Person
    attr_accessor :name, :age, :gender

    def initialize( name, age, gender )
        @name    =   name
        @age     =   age
        @gender  =   gender
    end

    def to_s
        "#{ name } is a #{ age } year old #{ gender }."
    end
end
```

Before the creation of any instances of the Person class, we want to open up the file in question, and use user input to get some stuff in there.

```ruby
db = File.new( 'database.txt', 'a+' )
# Create an instance of the File class.  Open up the database.txt file.  The 'a+' parameter says that if the file does not exist, create it (that is the plus bit), the 'a' says to open the file in append mode, ready to edit (the cursor is at the end of the file)

print "Would you like to add someone to the database? (y / n) "
response = gets.chomp.downcase

while response == "y"
    print "Enter name, age, gender (seperated with commas and spaces)"
    db.puts( gets.chomp ) # This puts the user input into the file (at the bottom because we have opened up the file in append mode)

    print "Would you like to add someone to the database? (y/n) "
    response = gets.chomp.downcase
end

db.close # Ruby can only open up 1000 files at once so you need to make sure you close the file!
```

That will have changed the file for us, and now we want to get into the reading of it (and the creation of instances of the Person class).

```ruby
people = []
db = File.open( 'database.txt', 'r' ) # r: read only
db.each do |line|
    person_data = line.chomp.split(", ")

    people << Person.new person_data[0], person_data[1], person_data[2]
end

people.each do |person|
    puts person
end
```

And that is the basis of File I / O in Ruby!

#### SQL

This is a really difficult topic and not one that we expect you to be able to write out - as long as you can get it in terms of principles - it is all good.

When we talk about tables and databases, there is really only 4 tasks that we need to do.

- **C**reate
- **R**ead
- **U**pdate
- **D**elete

This is called CRUD.

Involved in every database, there are a couple of things.  We have:

- The Database itself
- Individual tables
- Individual records on tables

Before we can do any actual action we need to create the database to work with...

```sql
CREATE TABLE table_name (
    -- Comma seperated list of attributes with a type and a list of options
    column_name DATATYPE
);

CREATE TABLE person (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    age INTEGER
);
```

This normally goes in a file with a file name ending with .sql.  You might call this person.sql, and obviously we can have lots of these. As many as you want.

This hasn't created the database though, we need to be explicit about that.

`sqlite3 desired_database_name.db < add_this_table.sql`

`sqlite3 database.db < person.sql`

This line will create the database.db file if necessary, and if not - it will just add whatever is defined in the .sql file specified.  It imports the details from the .sql into the database.db.

To make sure this has worked, type in `sqlite3 database.db` and hit enter in the terminal.  This will open up a direct line to the database in the current folder.  If you type `.schema` it will show the current tables.

_CREATE STEP_

Once we have the table defined, we need to figure out how to actually put records into it.

```sql
INSERT INTO table_name ( comma, seperated, columns ) VALUES ( commas_value, seperated_value, column_value);

INSERT INTO person (id, first_name, last_name, age) VALUES ( 0, "Zed", "Shaw", 37 );

-- We don't need to tell the attributes though, it can look just like this...

INSERT INTO person VALUES (0, "Zed", "Shaw", 37);
```

This is the creation step.  If you wrote this in a file, we can import that SQL into the database - `sqlite3 database_name.db < insert_stuff.sql`

_READ STEP_

This is pretty annoying to write.

```sql
-- SELECT what FROM what_table;
-- SELECT what FROM what_table WHERE options;

SELECT * FROM person; -- this will select all attributes and all records from the person database

SELECT name FROM person; -- only show the name attributes

SELECT * FROM person WHERE first_name == "Zed"; -- show all attributes from records in the person database where the first_name is "Zed"
```

_UPDATE STEP_

And this is pretty annoying to write.

```sql
UPDATE table SET attribute_name = attribute_value WHERE attribute_name = attribute_value;

UPDATE person SET first_name = "WOLF" WHERE first_name = "Zed";

```

_DELETE STEP_

AND this is pretty annoying to write.

```sql
DELETE FROM what_table WHERE what_attributes = what_value;

DELETE FROM person WHERE first_name = "Zed"; -- Delete all records in the person table where the first_name is equal to "Zed"
```

That is the basics of SQL, for more - see [here.](http://sql.learncodethehardway.org/book/)  It's all about the principles though, as long as you understand the fact that you need a database to have tables, and tables to have records - that is all good.

In terms of actual structure of an application, this is the structure of a CRUD application.  7 views for all of this!  The #new and the #edit are just ways to show the actual form.

|           | VERBS     | URLS                      | SQL       | NAME      |
|--------   |---------- |-----------------------    |--------   |---------  |
| CREATE    | POST      | /butterflies              | INSERT    | #create   |
|           |           | /butterflies/new          |           | #new      |
| READ      | GET       | /butterflies              | SELECT    | #index    |
|           | GET       | /butterflies/:id          | SELECT    | #show     |
| UPDATE    | POST      | /butterflies/:id          | UPDATE    | #update   |
|           |           | /butterflies/:id/edit     |           | #edit     |
| DELETE    | (Delete)  | /butterflies/:id          | DELETE    | #delete   |


CRUD is the foundation of most applications on the web, it is the thing that powers it!  Important to get the principles of it.