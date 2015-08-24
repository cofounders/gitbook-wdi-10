## Week 04, Day 01
### 24 / 08 / 2015

What we covered today:
- [Warmup Exercise](https://gist.github.com/ga-wolf/60ae6090f70d36db39aa)
    + [Solution](https://github.com/ga-wolf/WDI10-Homework/tree/master/warmup-exercises/week_04/difference_of_squares)
- [RVM and Ruby installation guide](https://gist.github.com/ga-wolf/98718aa5c63d8323ae46)
- Ruby
    + Data Types
    + Variables
    + Conditionals
    + Control Structures
    + Methods (Functions in JS)

#### How to get Ruby

Install Developer Tools from Xcode (this should have happened for most of you)

` xcode-select --install `

Access a specific URL using a secured line and run the downloaded program

` curl -sSL https://get.rvm.io | bash -s stable `

Restart the terminal, and try running the command ` rvm `.

If it doesn't work...

- Open the bash_profile up in Sublime

  ` subl ~/.bash_profile `

- Add these lines into the bottom of the bash_profile and save it

  ` [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" `

  ` export PATH="$PATH:$HOME/.rvm/bin" `

Restart the terminal again

` rvm `

` rvm list known `

` rvm get stable --auto `

Go here and find the most recent version - https://www.ruby-lang.org/en/downloads/

Latest version at the time of writing was 2.2.2, swap those in for the latest stable version that shows on that website

` rvm install ruby-2.2.3 `

` rvm --default use 2.2.3 `

Let's test that it has all worked.

- ` ruby -v `
- ` rvm -v `
- ` which ruby ` - should not return anything in the /usr/local/bin
- ` which rvm `

If all of this has worked, run...

` gem install pry `

#### Common Commands

`ruby -v` - Will return the current version of Ruby

`which ruby` - What is the path to the version of Ruby you are using

`ruby hello_world.rb` - Runs the hello_world.rb file

`irb` - Runs a ruby console

`pry` - Runs a better console

`<CTRL> + D` - Ends a file in irb or ruby

#### Data Types

_Strings_

Again, delimited by quotes.

`"string"`
`'string'`

_Numbers_

There are multiple types:

- Integer (Fixnum)
- Float
- Bignum

_Logical Operators_

Lots of them, but the basic ones are:

`+=` - Add then assign
`-=` - Minus then assign
`*=` - Multiply then assign
`/=` - Divide then assign
`**` - To the power of

_Comparison Operators_

All the same ones...

```
>
>=
<
<=
== # Normally stick to two equals in Ruby
===

<=> (returns -1 if less than, 0 if equal, and 1 if greater than)
etc.
```

_Variables_

No need for the var keyword.

`ruby = "is nice"`

Much harder to make global variables, it isn't the default behaviour in Ruby

_Methods (Functions in JS)_

`puts "this is like console.log`
`print "this is also like console.log`
`p "this is a bit more complex`

Brackets are mostly optional, occasionally necessary (only in method or function chaining)

`puts("this is like console.log)`

_Basic Naming Conventions_

snake_case_everywhere - very rare to see camelCase!

_Variable Interpolation in Strings_

Interpolation just means you can put code inside

```
name  = "gilberto"
drink = "scotch"

"My name is #{ name } and I drink #{ drink }!"
# A lot nicer than "my name is " + name + " and I drink " + drink
# Which is the way you would do it in JS
```

Interpolation only works with double quotes!!  Single quotes means leave this string alone, this is mine

_Comments in Ruby_

```ruby
# This is is a single line comment

# This is
# a multiline
# comment

# OR (don't do this)

=begin
This is also a multi line comment
You can't have any an empty line between the =begin and the start of the comment
=end
```

_Getting User Input_

In JS, we have prompt etc.

```ruby
# Initial greeting
puts "What is your first name?"

# first_name = gets
# This will wait for user input, and include the new line in the variable

first_name = gets.chomp
# This will wait for user input, and strip the new line from the variable
# For more documentation on chomp - http://ruby-doc.org/core-2.2.0/String.html#method-i-chomp

puts "Your first name is #{ first_name }."

puts "What is your surname?"
surname = gets.chomp
puts "Your surname is #{ surname }."

puts "Your full name is #{ first_name } #{ surname }"
# fullname = "#{ first_name } #{ surname }"
# Sames as ... puts "Your full name is #{ fullname }"

puts "What is your address?"
address = gets.chomp
puts "Your name is #{ fullname } and you live at #{ address }"

# INTERPOLATION ONLY WORKS ON DOUBLE QUOTES!
```

#### Conditionals

_IF STATEMENTS_

```ruby
if 13 > 10
    p "Yep, it is a bigger number"
end

grade = "A"

if conditional
    # To do
elsif conditional
    # To do
else
    # To do
end

p "Yep, it is a bigger number" if 13 > 10 # This only works in single line statements

# It's called a modifier (if modifier)
```

_UNLESS STATEMENTS_

```ruby
x = 1
unless x > 2
    puts "x is less than 2"
else
    puts "x is greater than 2"
end

code_to_perform unless conditional
```

_CASE STATEMENTS_

Think of these as shorter if statements, but don't overuse them (particularly in JS)

```ruby
grade = 'B'
case grade
when 'A'
    p 'Great Job'
when 'B'
    p 'Good Job'
when 'C'
    p 'Adequate Job'
else
    p 'Talk to the Hand'
end

case expression_one
when expression_two, expression_three
    statement_one
when expression_four, expression_five
    statement_two
else
    statement_three
end

# Very similar to the switch statement in Javascript!
```

Now that we know this stuff, give [these exercises a go.](https://gist.github.com/wofockham/67b291148a9efb6a7138)

_WHILE LOOPS_

```ruby
while conditonal
    statement
end

while true
    p "OMG"
end # BAD IDEA

i = 0
while i < 5
    puts "I: #{ i }"
    i += 1
end
```

_UNTIL LOOPS_

```ruby
until conditional
    statement
end

i = 0
until i == 5
    puts "I: #{ i }"
    i += 1
end
```

_ITERATORS_

So, so common in Ruby.

```ruby
5.times do
    puts "OMG"
end

5.times do |i|
    puts "I: #{ i }"
end
# The thing that times wants to pass into me is stored as the parameter between the pipe characters

5.downto(0) do |i|
    puts "I: #{ i }"
end
```

_FOR LOOPS (No one ever uses these)_

```ruby
# Don't ever use them

for i in 0..5
   puts "I: #{ i }"
end
```

_Generating Random Numbers_

```ruby
Random.rand # Generates a number between 0 and 1
Random.rand(10) # Generates a random number up to 10 (including zero and 10)
Random.rand(5..10) # Generates a number between 5 and 10 (also includes them)
Random.rand(5...10) # Does not include 5 and 10
```

Now that you know this stuff, have a crack at these [exercises.](https://gist.github.com/wofockham/275f43b104c81c641849)

#### Methods or Functions

```ruby
def hello
    # A plain method
end

hello # called like this

def hello( name )
    # A plain method that takes a parameter
    # When calling this, you MUST pass in a parameter or it will throw an error
end

hello "Wolf"    # Called this way
hello("Wolf")   # Or this

def hello( name = "World" )
    # A function with a default parameter
    # This won't throw an error in the case that you don't pass a parameter in
end

hello           # Works this way
hello("Wolf")   # Or this
```

Methods in Ruby have an implicit return, meaning that you don't need to actually use the return keyword, it does it automatically.

Parentheses are optional!

Here is the [homework](https://gist.github.com/wofockham/2752aa06121df7f3024c) for tonight!
