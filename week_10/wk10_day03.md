## Week 10, Day 03
### 07 / 10 / 2015

What we covered today:
- [Warmup](https://gist.github.com/ga-wolf/27360727e8866594e3a4) and [Test Suite](https://gist.github.com/ga-wolf/7c38ba73f2a7786e1637)
  + [Solution](https://github.com/ga-wolf/WDI10-Homework/tree/master/warmup-exercises/week_10/wordy_calculator)
- Rake Tasks
- Factory Girl
- Faker
- Lab: Tweet Eater

#### Automation

###### Rake

Rake is an automator for our computers.  It is actually Ruby Make.  Make is a really old program from the 1960's that used to take a whole heap of files (typically C files) and turn them into executable programs.  Rake does a somewhat similar thing, but runs tasks for us.

To see all available tasks, run ` rake -T `.

To work with them, we need to create a ` Rakefile `.  It doesn't have an extension.

A really basic Rakefile may look like this.

```rb
directory "tmp"
# This is saying that this file depends on a folder called tmp

# There is a file in the tmp/hello.tmp (that depends on the tmp folder itself)
file "tmp/hello.tmp" => "tmp" do

  # Run echo Hello World in the context of the shell (or terminal) and append it to the tmp/hello.tmp file.
  sh 'echo Hello World >> tmp/hello.tmp'
end
```

To run this particular command, we would run ` rake tmp/hello.tmp ` (i.e. the first parameter in the file command).

But this sort of stuff isn't that helpful.  What we really want to be able to do is run lots and lots of commands.  We still do this in a ` Rakefile `.

```rb
task :howl_at_the_moon do
  puts "Currently howling."
end
```

To run that particular command, we can just run ` rake howl_at_the_moon `.  But we can have lots of these tasks in here.

```rb
task :say_hello do
  puts "Hello."
end

task :think_of_the_moon do
  puts "(Oh no, I am thinking of the moon.)"
end

task :say_goodbye_and_run do
  puts "Goodbye."
  puts "(Running away)"
end

task :howl_at_the_moon do
  puts "(Currently howling)"
end
```

To run all of these we would have to run lots of tasks...
- rake say_hello
- rake think_of_the_moon
- rake say_goodbye_and_run
- rake howl_at_the_moon

It becomes quite arduous if we are constantly running all of those commands for every single social situation we are involved in.  But, of course, there is a solution.

```rb
task :interact_socially => [ :say_hello, :think_of_the_moon, :say_goodbye_and_run, :howl_at_the_moon ] do
  puts "You aren't overly social, are you?"
end
```

This is saying there is a task that calls all of the functions (called dependencies) in the array, and that at the end, puts a comment on the screen.

To call this, we just run ` rake interact_socially `.  But we still need to specify the method we want to call. What if we wanted that to be the default behaviour?

```rb
# We add this to the top of the file.
task :default => 'interact_socially'
```

Now we can just run it by running ` rake ` now.  Imagine I needed a method that says hello in a variety of contexts.  Perhaps I wanted to say hi in a professional sense and a social sense.  That is where namespacing comes into play - this is because we want to group a bunch of tasks together.

```rb
namespace :social
  task :say_hello do
    puts "Hello."
  end

  task :think_of_the_moon do
    puts "(Oh no, I am thinking of the moon.)"
  end

  task :say_goodbye_and_run do
    puts "Goodbye."
    puts "(Running away)"
  end

  task :howl_at_the_moon do
    puts "(Currently howling)"
  end
end

namespace :professional
  task :say_hello do
    puts "What am I doing?"
  end
end
```

To run each one of these say_hello...  ` rake social:say_hello ` and ` rake professional:say_hello `.  This is the way that Rails works behind the scenes.

Now, as I mentioned before, you can show all available tasks using ` rake -T `.  But now of ours are showing up!  To sort that out, we need to give each task (or method) a description.

```rb
namespace :social
  desc "Say Hello"
  task :say_hello do
    puts "Hello."
  end

  desc "Lose track and start thinking of the moon"
  task :think_of_the_moon do
    puts "(Oh no, I am thinking of the moon.)"
  end

  desc "Figure the moon is more important"
  task :say_goodbye_and_run do
    puts "Goodbye."
    puts "(Running away)"
  end

  desc "Find the moon and howl"
  task :howl_at_the_moon do
    puts "(Currently howling)"
  end
end
```

Now, when we run ` rake -T `, you can see all of those commands.  One of the most powerful things about all of this though is that you can reopen tasks and namespaces and add more and more content.  You can also call in either rake tasks from different namespaces.

For example, in a Rails project, we can reopen the db namespace and add new tasks.

```rb
namespace :db do
  desc "Drop, recreate and remigrate the database"
  task :regenerate do
    # Go into all available Rake tasks, and invoke it
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
  end
end
```

Lots, lots more that you can do with it all.

#### [Faker](https://github.com/stympy/faker) and [Factory Girl](https://github.com/thoughtbot/factory_girl)

Faker and Factory Girl are automators for testing databases normally.  They make generation of things like users easy and <variable class=""></variable>  A basic factory may look like the following...

```rb
FactoryGirl.define do
  factory :user do
    name "Craigsy"
    email "craigsy@hotmail.com"
  end
end
```

If we run ` FactoryGirl.create( :user ) `, it will actually create a new user and put it in the database.  If we wanted to create lots at a time, we could do the following... ` FactoryGirl.create_list( :user, 10 ) ` and that will make 10 users (but they all have the same name!).

Now, this is where Faker comes in.  Worth having a look at the docs for that, but there are lots of things that it helps with.

Some common uses of Faker.

```
Faker::Name.name
Faker::Internet.email

Faker::Company.name
Faker::Company.catch_phrase # Very good

Faker::Date.between(2.days.ago, Date.today)
Faker::Date.forward(23) # Up to 23 days away
Faker::Date.backward(14) # No more than 14 days ago

Faker::Lorem.paragraphs
```

Everytime you run this, it will generate a random thing of some description, so you think it would be relatively straight forward to create unique users.  Maybe something like this?

```rb
FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    email Fake::Internet.email
  end
end
```

We can still run this using ` FactoryGirl.create_list( :user, 50 ) ` but they are still all the same!  We solve this problem by using sequences, this means that they get evaluated every time.

```rb
FactoryGirl.define do
  factory :user do |f|
    f.sequence(:name) { Faker::Name.name }
    f.sequence(:email) { Faker::Internet.email }
  end
end
```


That will do exactly what we want.  But what if we wanted to make some tweets that are associated with a particular user?  We can do that too!!  (Assuming we have the right associations).

```rb
FactoryGirl.define do
  factory :user do |f|
    f.sequence(:name) { Faker::Name.name }
    f.sequence(:email) { Faker::Internet.email }

    factory :user_with_tweets do
      after(:create) do |u|
        FactoryGirl.create_list(:tweet, Random.rand(10..100), :user => u)
      end
    end
  end

  factory :tweet do |f|
    f.sequence(:content) { Faker::Lorem.sentence }
  end
end
```

To run this, and this seems weird, we run ` FactoryGirl.create_list( :user_with_tweets, 20 ) `.  This will create lots of tweets for lots of users and associate them correctly.

#### Tweet Eater

Make a Rails application that has users and tweets (a user has many tweets).

- Make some Rake tasks and keep them contained within a 'twitter' namespace!
  + Have a clear task, that empties the users and tweets table
  + Have a dummy posts task, that generates a bunch of random tweets and users using Factories
  + Have search task, that accepts a search query and a limit. It should use the Twitter API and receive a bunch of search results
