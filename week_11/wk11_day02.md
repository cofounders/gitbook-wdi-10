## Week 11, Day 02
### 13 / 10 / 2015

What we covered today:
- [Warmup](https://gist.github.com/ga-wolf/78a017a7897c5fee6abb) and [Test Suite](https://gist.github.com/ga-wolf/b2a12c312129d1fe6f1b)
  + [Solution](https://gist.github.com/Scoutski/93da0532a1a865ad1be3)
- [The Art of Unix Programming](http://catb.org/~esr/writings/taoup/html/)
- Data Structures
- Interview Questions [III](https://gist.github.com/wofockham/f43799998e9995f5e1f5)
- Anonymity
- Lab/Homework - Singly Linked List

#### The Art of Unix Programming

###### According to Doug Mcilroy

- Make each program do one thing well. To do a new job, build afresh rather than complicate old programs by adding new features.
- Expect the output of every program to become the input to another, as yet unknown, program. Don't clutter output with extraneous information. Avoid stringently columnar or binary input formats. Don't insist on interactive input.
- Design and build software, even operating systems, to be tried early, ideally within weeks. Don't hesitate to throw away the clumsy parts and rebuild them.
- Use tools in preference to unskilled help to lighten a programming task, even if you have to detour to build the tools and expect to throw some of them out after you've finished using them.

###### According to Rob Pike

- You can't tell where a program is going to spend its time. Bottlenecks occur in surprising places, so don't try to second guess and put in a speed hack until you've proven that's where the bottleneck is.
- Measure. Don't tune for speed until you've measured, and even then don't unless one part of the code overwhelms the rest.
- Fancy algorithms are slow when n is small, and n is usually small. Fancy algorithms have big constants. Until you know that n is frequently going to be big, don't get fancy. (Even if n does get big, use Rule 2 first.)
- Fancy algorithms are buggier than simple ones, and they're much harder to implement. Use simple algorithms as well as simple data structures.
- Data dominates. If you've chosen the right data structures and organized things well, the algorithms will almost always be self-evident. Data structures, not algorithms, are central to programming.

###### The Main Things

- **Rule of Modularity**: Write simple parts connected by clean interfaces.
- **Rule of Clarity**: Clarity is better than cleverness.
- **Rule of Composition**: Design programs to be connected to other programs.
- **Rule of Separation**: Separate policy from mechanism; separate interfaces from engines.
- **Rule of Simplicity**: Design for simplicity; add complexity only where you must.
- **Rule of Parsimony**: Write a big program only when it is clear by demonstration that nothing else will do.
- **Rule of Transparency**: Design for visibility to make inspection and debugging easier.
- **Rule of Robustness**: Robustness is the child of transparency and simplicity.
- **Rule of Representation**: Fold knowledge into data so program logic can be stupid and robust.
- **Rule of Least** Surprise: In interface design, always do the least surprising thing.
- **Rule of Silence**: When a program has nothing surprising to say, it should say nothing.
- **Rule of Repair**: When you must fail, fail noisily and as soon as possible.
- **Rule of Economy**: Programmer time is expensive; conserve it in preference to machine time.
- **Rule of Generation**: Avoid hand-hacking; write programs to write programs when you can.
- **Rule of Optimization**: Prototype before polishing. Get it working before you optimize it.
- **Rule of Diversity**: Distrust all claims for “one true way”.
- **Rule of Extensibility**: Design for the future, because it will be here sooner than you think.

#### Data Structures

Some other ones...  In traditional programming, we didn't start off with things like Arrays etc.  We had a couple of far more "primitive" primitive types.

###### Stacks (Last In, First Out)

Similar to a stack of plates, you can only remove things from the end.

###### Queue (First In, First Out)

You can shift things from the front of the queue, and you can add things to the end.

Now we don't really need to worry about these things as they are already made for us. But we can make our own. Enter the...

###### Singly-Linked List

We need two things, a node (not Node.js) and a Singly Linked List. They look like the following:

_Node_

```rb
class Node
  attr_accessor :value, :next

  def initialize( value = next )
    @value = value
    @next = nil
  end
end

jane = Node.new "Jane"
serge = Node.new "Serge"
```

_Singly Linked List_

```rb
class SinglyLinkedList
  attr_accessor :head
  def initialize( first_value = nil )
    @head = Node.new( first_value ) if first_value
  end

  class Node
    attr_accessor :value, :next
    def initialize
      @value = value
      @next = nil
    end
  end
end

serge_and_jane = SinglyLinkedList.new 'Serge'
serge_and_jane.push "Jane"
```

This is enough to create a basic structure. The head element in our SinglyLinkedList exists and is exactly what we want it to be. But we need to add some more functionality!

```rb
class SinglyLinkedList
  attr_accessor :head
  def initialize( first_value = nil )
    @head = Node.new( first_value ) if first_value
  end

  def prepend( value )
    node = Node.new( value )  # Create a new instance of the Node class
    node.next = @head         # Move the head to the next variable
    @head = node              # Reassign the head to be the new instance
  end
end

bros = SinglyLinkedList.new "Groucho"
bros.push "Harpo"
bros.push "Chico"

# chico.head
# chico.head.next.value
# chico.head.next.next.value
```

Now, that is a really basic implementation, but we want to add a bit more stuff.  We want you to add the following methods:

```rb
def append
end

def last # Returns the last node
end

def insert_after( node, new_node ) # Puts something in the middle
end

def length # R
end

# MORE COMPLEX

def find( needle ) # Returns the needle as its value
end

def reverse
end

def reverse!
end

# MORE, MORE COMPLEX

def each
end

# MORE, MORE, MORE COMPLEX

def [](n)
end

def []=( n, value )
end
```

That is the homework!


