## Week 01, Day 01.
### 03 / 08 / 2015

What we covered today:
- Introduction | Orientation | Housekeeping
- Structure of the Course
- Introduction to the Command Line

#### Introduction | Orientation | Housekeeping

**[Joel's slides](https://github.com/wofockham/wdi-9/tree/master/00-intro)**

**Joel Turnbull** - Lead Instructor - [jturnbull@ga.co](mailto:jturnbull@ga.co)

**Jack Jeffress** - Co-instructor / Developer in Residence - [jack.jeffress@ga.co](mailto:jack.jeffress@ga.co)

**Michael Cooper** - Teachers Assistant

**Gigi Tsang** - Producer - [gigi@ga.co](mailto:gigi@ga.co)

**Meggan Turner** - Assistant Course Producer - [meggan.turner@ga.co](mailto:meggan.turner@ga.co)

**Penny Blackmore** - Outcomes Producer - [penelope@ga.co](mailto:penelope@ga.co)

The Office is typically open from 8am to 9pm.

#### Classroom Culture

- Keep positive
- Don't be a dick
- There are no silly questions
- No crying
- Look after personal hygiene
- Phone on silent
- Be present
- Supportive, friendly environment
- Environment of teamwork and collaboration
- Don't be afraid to ask for help
- Keep your sense of humour
- Be different
- Don't leave anyone hanging
- Try to teach others
- Stay caffeinated...

#### Geek | Haker Culture

Share and enjoy.

Books, movies and TV series, stupid memes

[The Jargon File](http://www.catb.org/jargon/html/index.html)

[The Tao of Programming](http://canonical.org/~kragen/tao-of-programming.html)

["Kicking a dead whale up a beach"](http://www.catb.org/jargon/html/L/like-kicking-dead-whales-down-the-beach.html)

#### Necessary Links, Meetups and Newsletters

**Links**
- [Ruby on Rails](http://rubyonrails.org/)
- [Ruby on Rails Community](http://rubyonrails.org/community)
- [#rubyonrails on Freenode IRC](http://webchat.freenode.net/)

**Newsletters**
- [Ruby Weekly](http://rubyweekly.com/)
- [Javascript Weekly](http://javascriptweekly.com/)
- [Versioning](http://www.sitepoint.com/versioning/)
- [Sidebar](http://sidebar.io/)

**Meetups**
- [RORO](http://ruby.org.au/meetups/syd.html)
- [SydJS](http://www.sydjs.com/)

**Also, check out these**
- [Web Design Field Manual](http://webfieldmanual.com/)
- [Web Design Stack](http://webdesignstack.com/)
- [Panda App](http://usepanda.com/app/)

#### Other

What will go wrong? Everything. This won't be easy for anyone.

> "If debugging is the practice of removing bugs from software... Then programming must be the practive of adding them." – E. W. Dijkstra

The best thing you can learn as a beginner is **how to debug.**

##### A Typical Day here at GA...

| Time           | What?           |
| :------------- | :-------------- |
| 09:00 - 10:00  | Warmup Exercise |
| 10:00 - 01:00  | Code Along      |
| 01:00 - 02:00  | Lunch           |
| 02:00 - 02:30  | Review          |
| 02:30 - Beyond | Labs / Homework |

Breaks for morning and afternoon tea last for twenty-ish minutes and are whenever works best.

In terms of homework, we like to keep you busy until 9 or 10.

We have office hours here in Sydney (except during Week 6 - we have the Spit to Manly.)

#### Structure of the Course

- Week 01 - Front End
- Week 02 - Front End
- Week 03 - Project 00
- Week 04 - Ruby
- Week 05 - Ruby on Rails
- Week 06 - Project 01
- Week 07 - Advanced Front End
- Week 08 - Advanced Front End
- Week 09 - Project 02
- Week 10 - Advanced Back End / Advanced Everything
- Week 11 - Advanced Back End / Advanced Everything
- Week 12 - Project 03

#### The Command Line

[Download iTerm 2](http://iterm2.com/)

Web programmers have to live on the command line. It gives us fast, reliable, and automatable control over computers. Web servers usually don't have graphical interfaces, so we need to interact with them through command line and programmatic interfaces. Once you become comfortable using the command line, staying on the keyboard will also help you keep an uninterrupted flow of work going without the disruption of shifting to the mouse.

The command-line interface, is often called the CLI, and is a tool, that by typing commands, performs specific tasks.  It has the potential to save you lots and lots of time because it can automate things, loop through items etc.

`date` - Will print the current date and time

`which date` - Will show the relevant file (will probably return **/bin/date**)

`pwd` - Stands for **Print Working Directory**, will show you where you are in your computer

`clear` - Will clear the screen (ctrl + l will do this as well)

`reset` - Will reset your terminal

`cd` - Stands for **change directory**

`cat filename` - Will show you the contents of the specified file

`whoami` - Will show the logged in user

`ps` - Will you show you all running processes

`ps aux` - Will show you all of the running processes with more details

`top` - Will show you the **Table of Processes**

`grep` - Stands for **Global Regular Expression Print** - useful for finding files or content

`ls`- Short for List.  This will show you all of the files and folders in the current directory

`ls /bin` - Will show you all terminal commands

Most commands will have additional **flags**.  A flag is a request for more information.

A good example of this is the following:
```sh
> ls
Applications Documents Desktop etc.
> ls -l
drwx------   6 jackjeffress  staff   204 16 Mar 15:39 Applications
etc.

#https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/ls.1.html
```

```sh
# cd can do a lot of things!

> cd
# Will take you back to your "home folder"
> cd /
# Will take you back to your "root folder"
> cd FolderName
# Will take you into the specified folder name
> cd FolderName/AnotherFolderName
# Will take you through FolderName and then into AnotherFolderName
```

```sh
# We can make folders in the CLI by using mkdir

> mkdir Projects
# Then we can move into it
> cd Projects
# ls will show most of your files (ones that aren't prefixed by a .)
> ls
# ls -la will show every file (even hidden files)
> ls -la
# This will change to the current directory
> cd .
# This will open the current directory in Finder
> open .
# This will go back to the previous directory
> cd ..
# If you hit tab at this point, it would autocomplete for you
> cd pro
# This will create a markdown file called README
> touch README.md
# To open an application in terminal (can use any application that you have)...
> open -a "Sublime Text"
```

```sh
# This will open the file and show the contents
> cat books
# Will show you the contents, pipe it into the sort program. This doesn't change the original!
> cat books | sort
# The pipe character pipes the output to a command
# This will sort the contents and books, and put the sorted contents into the sorted_books file (it will create the file if necessary)
> cat books | sort > sorted_books
# This will rename the sorted_books to books (and will overwrite the books file if it already exists)
> mv sorted_books books
# This will open and show the contents and books, and shows only lines that have the word script in them (case sensitive!)
> cat books | grep script
# To copy a file, the command is cp (this needs parameters - or arguments. It needs a source and a destination).
# cp source destination
> cp books my_books
# To remove things, use the rm command (this doesn't get moved to your trash! It will delete it permanently and is impossible to undo)
> rm my_books
```

What happens when we run commands?

```sh
# It will go through all of the folders and files that are shown when we run the following command, and use the contents of the files to decide whether it can run that particular program or command
> echo $PATH
```

[Here is a basic bash profile.](https://gist.github.com/wofockham/848f06084271030b88ea)

Some recommended readings when it comes to the Command Line Interface (CLI):
- [http://en.flossmanuals.net/command-line/index/](http://en.flossmanuals.net/command-line/index/)
- [http://cli.learncodethehardway.org/book/](http://en.flossmanuals.net/command-line/index/)
- [http://cristal.inria.fr/~weis/info/commandline.html](http://cristal.inria.fr/~weis/info/commandline.html)
- [https://quickleft.com/blog/tag/command-line/page/4/](https://quickleft.com/blog/tag/command-line/page/4/ )
- [http://en.wikipedia.org/wiki/The_Unix_Programming_Environment](http://en.wikipedia.org/wiki/The_Unix_Programming_Environment)
    - [This PDF download might work...](https://ga-students.slack.com/?redir=%2Ffiles-pri%2FT0351JZQ0-F04J0GTB0%2Funix.pdf)

###### Some other useful links...
- [15 Use Cases of Grep](http://www.thegeekstuff.com/2009/03/15-practical-unix-grep-command-examples/)
- [40 Terminal Tips and Tricks](http://computers.tutsplus.com/tutorials/40-terminal-tips-and-tricks-you-never-thought-you-needed--mac-51192)
- [Terminal Cheatsheet](https://github.com/0nn0/terminal-mac-cheatsheet/wiki/Terminal-Cheatsheet-for-Mac-(-basics-))

#### Homework

- Track down the Terminal City murderer
- Make a start reading up on the command line documentation of your choice (select from the links in recommended readings just above!)
- Finish the WDI Fundamentals pre-work and bring any questions for tomorrow
- Install Google Chrome if you haven't already
- Find some Sublime Text tutorials and screencasts -- we'll be using ST extensively
    * [The best one - https://scotch.io/bar-talk/the-complete-visual-guide-to-sublime-text-3-getting-started-and-keyboard-shortcuts](https://scotch.io/bar-talk/the-complete-visual-guide-to-sublime-text-3-getting-started-and-keyboard-shortcuts)
    * [http://code.tutsplus.com/tutorials/useful-shortcuts-for-a-faster-workflow-in-sublime-text-3--cms-22185](http://code.tutsplus.com/tutorials/useful-shortcuts-for-a-faster-workflow-in-sublime-text-3--cms-22185)
    * [http://code.tutsplus.com/articles/perfect-workflow-in-sublime-text-free-course--net-27293](http://code.tutsplus.com/articles/perfect-workflow-in-sublime-text-free-course--net-27293)
- Start reading up on and practicing [Markdown](http://en.wikipedia.org/wiki/Markdown) (you can experiment with Markdown here: https://gist.github.com/)

###### If you want to learn Markdown...

- [http://markdowntutorial.com/](http://markdowntutorial.com/)
- [https://help.github.com/articles/markdown-basics/](https://help.github.com/articles/markdown-basics/)
- [http://daringfireball.net/projects/markdown/basics](http://daringfireball.net/projects/markdown/basics)
- Marxi Co is a great place to edit Markdown files (syncs with Evernote as well). [Go here to check it out](http://marxi.co/)