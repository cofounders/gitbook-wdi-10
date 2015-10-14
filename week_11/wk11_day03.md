## Week 11, Day 03
### 14 / 10 / 2015

What we covered today:
- [Warmup](https://gist.github.com/ga-wolf/c5d569536ee694fcfef5) and [Test Suite](https://gist.github.com/ga-wolf/f938a31a3ed666c05a28)
    + [Documented Solution](https://gist.github.com/Scoutski/84e25ee8c50a8d4817ec)
- YouTeach
  + Kylie
  + Will
- [Singly Linked List](https://github.com/wofockham/wdi-9/blob/master/11-compsci/data_structures/sll/singly_linked_list.rb)
- [Yield](http://www.tutorialspoint.com/ruby/ruby_blocks.htm)
- Recursion

#### Yield

We have all seen that you can pass a block (kind of like an anonymous function in Javascript) into methods in Ruby.  This allows us to do a bunch more stuff.

Things to remember about blocks...

- They are chunks of code
- You can assign a name to a block
- The code in the block is always enclosed within curly brackets or within a do and an end

When passing in a block, you invoke it by using the ` yield ` statement.  An example...

```rb
def example
  puts "You are in the example method"
  yield
  puts "You are back in the example method"
  yield
end

example do
  puts "You are in the block that was yielded"
end

example { puts "You are in the block that was yielded" }
```

We can obviously pass parameters with the yield statement...

```rb
def example
  puts "You are in the example method"
  yield( 50, "Yay" )
  puts "You are back in the example method"
  yield( 100, "Woo" )
end

example do |num, proclamation|
  puts "You are in the block that was yielded. #{num} and #{proclamation} was passed in."
end

example { |num, proclamation| puts "You are in the block that was yielded. #{num} and #{proclamation} was passed in." }
```

Finally, we can check whether a block was passed in using the special ` block_given? ` predicate method.

```rb
def example
  puts "You are in the example method"
  yield( 50, "Yay" ) if block_given?
end

example # Just puts "You are in the example method"

example do |num, proclamation|
  puts "You are in the block that was yielded. #{num} and #{proclamation} was passed in."
end # Puts multiple things
```

#### Ruby Mixins

This is based on the implementation of a SinglyLinkedList found [here.](https://github.com/wofockham/wdi-9/tree/master/11-compsci/data_structures/sll)

```rb
class SinglyLinkedList
  include Enumerable

  ...
end
```

Enumerable is a mixin, it is a whole chunk of native Ruby code that you can include in any class that you like.  The way that it works is that if you provide a working ` each ` method, everything like ` map `, ` reject ` etc. comes for free.  Very useful!

Worth having a look at the Enumerable mixin's [documentation](http://ruby-doc.org/core-2.2.2/Enumerable.html).  Also, here is a good discussion about [Enumerables](http://www.sitepoint.com/guide-ruby-collections-iii-enumerable-enumerator/).

#### Recursion

Recursion is a weird concept. More or less, it is when things call themselves. But have a look [here](http://ruby.bastardsbook.com/chapters/recursion/), [here](http://www.sitepoint.com/functional-programming-techniques-with-ruby-part-iii/), [here](https://en.wikipedia.org/wiki/Recursion) and [do this.](http://www.theodinproject.com/ruby-programming/recursive-methods) This is a countdown written without recursion.

```rb
def countdown( count )
  # THIS
  # while count >= 0
  #   puts count
  #   count -= 1
  # end
  # OR THIS

  count.downto(0) do |i|
    puts i
  end

  puts "Blast Off!"
end
```

Things to remember with a recursive method or function...
- Recursive means you need to call itself
- It needs to move towards the base case/end condition
- Recognizes the end condition

And this is it written with recursion. No need for loops!

```rb
def countdown_recursive( count )
  if count < 0 # Base Case or End Condition
    puts "Blast Off!"
  else
    puts count
    countdown_recursive( count - 1 ) # Recursive Call + move towards end condition
  end
end
```

Now, Ruby isn't great at Recursion as it keeps track of exactly where it is in a program.  i.e. It will remember that it called the method a million times.  Lots of languages are much better but Ruby is heading that way.  Have a look at this [link.](http://nithinbekal.com/posts/ruby-tco/)  This talks about a thing called Tail Call Optimization, which is more or less a way to get Ruby to not care about where it is in the program or method if the last line in that particular method is recursive. Remember that this is highly experimental, it doesn't come naturally in Ruby.

Another good example of Recursion is to do a Factorial.

Here is the iterative version.

```rb
def factorial( num )
  product = 1
  n.downto( 1 ) do |i|
    product *= 1
  end
  product
end

factorial( 7 ) # => 5040
factorial( 12 ) # => 479001600
```

And here is the recursive version.

```rb
def factorial( num )
  return 1 if num <= 1
  num * factorial( num - 1 )
end
```

Another good example of it is the Fibonacci sequence.

Iterative version...

```rb
def fibonacci( n )
  a = 1
  b = 1

  while n > 1
    a, b = b, a + b # Parallel assignment
    n -= 1
  end

  a
end

1000.times do |i|
  puts "fibonacci(#{ i }) = #{ fibonnaci( i ) }."
end
```

Recursive version...

```rb
def fibonacci( n )
  if ( n <= 2 )
    1
  else
    fibonacci( n - 1 ) + fibonnaci( n - 2 )
  end
end

100.times do |i|
  puts "fibonacci(#{ i }) = #{ fibonnaci( i ) }."
end
```

This is very slow though! Worth having a look at memoization in Ruby if you want to find the most efficient method to get through this.  Another faster version...

```rb
def fibonacci( n, a = 1, b = 1 )
  if n <= 1
    a
  else
    fibonacci( n - 1, b, a + b )
  end
end

100.times do |i|
  puts "fibonacci(#{ i }) = #{ fibonnaci( i ) }."
end
```
