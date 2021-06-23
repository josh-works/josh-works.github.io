---
layout: post
title:  "Turing Prep Chapter 2: Run your first tests (and make them pass)"
date:  2019-05-19 06:00:00 -0700
crosspost_to_medium: false
categories: [turing]
tags: [programming, turing]
image: /images_2020/turing-prep-series-cover.jpg
permalink: turing-backend-prep-02-first-tests-and-making-them-pass
issue_id: 32
---

{% include turing_prework_index.md %}

------------------------

A warning - the hours ahead that you spend on this will be chock full of error messages. Embrace googling error messages! When in doubt, google it, even if it's meaningless to you! Somewhere on the internet exists hints and clues about what to do.

This skill set (googling for hints, using those hints to improve your googling, testing those assumptions, not giving up, etc) is known as **technical sophistication**. 

Every time you encounter something unfamiliar, and google your way to an understanding and/or solution, you're building _technical sophistication_:

> In technology, a similar skill (or, more accurately, set of skills) [as mathematical maturity] exists in the form of **technical sophistication**. In addition to “hard skills” like familiarity with text editors and the Unix command line, technical sophistication includes “soft skills” like looking for promising menu items and knowing the kinds of search terms to drop into Google... along with an attitude of doing what it takes to make the machine do our bidding. 
>
> These soft skills, and this attitude, are hard to teach directly, so as you progress through this and subsequent Learn Enough tutorials you should always be on the lookout for opportunities to increase your technical sophistication... Over time, the cumulative effect will be that **you’ll have the seemingly magical ability to do everything in every program**.
>
> \- Michael Hartl, [https://www.learnenough.com/command-line-tutorial](https://www.learnenough.com/command-line-tutorial/basics#aside-technical_sophistication)

Technical sophistication aside, I've put [together a list of trouble-shooting steps]({{ site.baseurl }}{% link _posts/2019-05-19-turing_prework_troubleshooting.md %}) for errors various students have run into, and I've helped them resolve. If you hit a problem, check here to see if someone else has seen it too.

<!--more-->
--------------------------

# Seven steps to your first completed `ruby-exercise` lesson:

1. figure out how to download the correct repositories
1. use your terminal to explore what you've downloaded
1. open the correct files in Atom
1. "run" the files in your terminal and work through the error messages
1. learn the basics of Minitest
1. get your first passing test in the `strings.rb` file
1. make the whole file pass!

Throughout this whole process, I hope you maintain a sense of curiosity about the steps involved. You'll encounter error messages, new terminology, shortcuts for moving around your terminal, and lots of new information around Ruby and testing and such. If you have not read part 1 of this guide, and the two books referenced therein, [now would be a great time to do so]({{ site.baseurl }}{% link _posts/2019-05-09-turing_prework_01_intro.md %}).

I've included a video walkthrough of everything you need to get started:s

<div class="container">
<iframe class="video" src="https://www.youtube.com/embed/aeAkLxr5diE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>



## 1. Clone the repository

Download the exercises: [https://github.com/turingschool/ruby-exercises](https://github.com/turingschool/ruby-exercises)


Note: "the repository" means "a collection of files and folders on Github.com". "Cloning it" means "copy those files and folders to your computer". 

To do this, first visit this URL: [https://github.com/turingschool/ruby-exercises](https://github.com/turingschool/ruby-exercises)

Click the `Clone or download` button:

![clone repo](/images/2019-05-19-turing_prework_02_03.jpg)

The URL you receive will look like one of these two options:

- `https://github.com/turingschool/ruby-exercises.git`
- `git@github.com:turingschool/ruby-exercises.git`

It doesn't matter which one you use. To exercise your _technical sophistication_ muscles, you can read more on [the difference between HTTPS and SSH URLs here](https://help.github.com/articles/which-remote-url-should-i-use/)

Now, in your terminal, navigate to where you want these exercises to be downloaded. You probably have a `turing` directory in your home folder. 

_Note: If you've not yet watched the video walk-through, I strongly suggest watching it. I used to have a bunch of instructions listed out below, but since writing them out here, I updated them [in this authoritive location](https://github.com/turingschool/ruby-exercises). I almost deleted the rest of this post in favor of the guide there, but I'm leaving it just in case I find out I need some portion of it later._

_Here's how to find those instructions:_

- _Head to the ruby exercises URL: [https://github.com/turingschool/ruby-exercises](https://github.com/turingschool/ruby-exercises)_
- _Scroll down the page and follow the instructions._

_When you're done with setting this up and have your first passing test, jump to the [what is minitest?](#5-learn-the-basics-of-minitest) section_


--------------------------------------

_Here's the original instructions:_

Since I have a `turing` directory in _my_ home folder, I would use:

```zsh
$ cd ~/turing/prework
```

You might place these files somewhere else. Up to you. Once you've `cd`'ed into the right directory, clone down the repo. We'll use the `git clone` command:

```console
$ git clone https://github.com/turingschool/ruby-exercises.git
```

or, if you received the SSH url:

```console
$ git clone git@github.com:turingschool/ruby-exercises.git
```

PS: As a reminder, commands formatted like the above, especially beginning with the `$` sign, should be run in your terminal. If you see a `//` sign, the text that follows it should be treated as a comment. For example:

```console
// lets `cd` to our home directory:
$ cd ~

// now lets look at all of our hidden files using the [a]ll flag:
$ ls -a
```

## 2. Use your Terminal to explore what you've downloaded

You should be able to see the cloned directory on your machine. If you run `ls` in the directory you just ran the `git clone` command, you should see an entry for `ruby-exercises`. 

now, `cd` into the `ruby-exercises` directory:

```console
$ cd ruby-exercises
```

Lets start with heading into `/data-types/strings/`:

```console
// first, `cd` into the `data-types` directory
$ cd data-types

// i usually run `ls` just to see what is in each level of a directory. 
// I'm a curious person.
$ ls

// now `cd` into the `strings` directory:
$ cd strings

$ ls
```
When you call `ls` the last time, you should see `README.md` and `strings.rb`. 

It will look a bit like this:

```console
$ ls
README.md
strings.rb
```

If this is what you see, you made it! 

If not, `cd` up a level or two, and look around again. (To change directories _up_, you can do 
  
```console
$ cd ..
```
  
## 3. Open everything in Atom

now we'll open everything in Atom: 

```console
$ atom .
```

Click the `README` file, and read it. 

If you have problems opening atom, read the [Troubleshooting Errors: Cannot open atom from the terminal]({{ site.baseurl }}{% link _posts/2019-05-19-turing_prework_troubleshooting.md %}#cannot-open-atom-from-the-terminal) post

## 4. Run the file in your terminal. Resolve gem-related error messages

Run the file in your editor with:

```console
$ ruby strings.rb
```

You might get an error like this. (I've highlighted the relevant pieces of the error. The first highlight shows where in the file we ran into the problem, and it's line 3 of the `strings.rb` file. 

The second highlight says "cannot load such file -- pry".

![pry missing](/images/2018-09-19-turing_prework_02_01.jpg)

Now, take a look at line three of `strings.rb`:

![line 3](/images/2018-09-19-turing_prework_02_02.jpg)

That's a gem we need. 

If you don't get this error, great! You already have `pry` on your machine, and you can skip the next section.

### What the heck is a "ruby gem"

A "gem" is just a little bundle of code that interacts with Ruby. 

[Here's a rather verbose description of what gems are.](https://en.wikipedia.org/wiki/RubyGems)

And, since we need to install the `pry` gem, we can look it up and see what it does. I googled `ruby gem pry` and clicked the first result, which brought me to: https://github.com/pry/pry

Feel free to read the docs, and get a feel for what Pry can do for you.

Anyway, install the Pry gem with:

```console
$ gem install pry
```

If you want to see all of the gems installed on your computer already, you can run:

```console
gem list
```
You can read more about [the `gem` command here](https://guides.rubygems.org/rubygems-basics/)

If you get an error like this:

```console
ERROR:  While executing gem ... (Gem::FilePermissionError)
    You don't have write permissions into the usr/lib/ruby/gems/pry directory.
```

I've got trouble-shooting instructions [in the troubleshooting guide]({{ site.baseurl }}{% link _posts/2019-05-19-turing_prework_troubleshooting.md %}#gem-install-pry-failing-with-you-do-not-have-permission)

## 5. Learn the basics of Minitest

See the references to `minitest` at the top of the file? `minitest/autorun` and `minitest/pride`?

These are "modules" of the `minitest` gem. 

I _strongly_ recommend "pausing" this guide and reading (and re-reading, and write all the code from all the examples in) this _excellent_ guide: [https://launchschool.com/blog/assert-yourself-an-introduction-to-minitest](https://launchschool.com/blog/assert-yourself-an-introduction-to-minitest)

I'll state that again. Read and study the Minitest guide. It is _fantastic_ and will set you up for success for the rest of Turing:

[https://launchschool.com/blog/assert-yourself-an-introduction-to-minitest](https://launchschool.com/blog/assert-yourself-an-introduction-to-minitest)

-------------------------------------------------

Did you read the Launch School post? Great! Then most of what is in this file should look a lot more readable to you.

As a quick test, answer the following questions:

- What is minitest?
- what is a Domain-Specific Language (DSL)?
- What does `assert_equal` mean? How many arguments does it expect?
- Will `assert_equal true, "true"` pass? 
- How do you "run" a test file?
- is a "failing" test a bad thing?
- does minitest run all the tests in order?
- Find a list of minitest assertions (google it!). What's a cool one you found?

Awesome. If you can answer all of those questions, you've got your head wrapped around Minitest. Onward!

------------------------------------------------------

## 6. Run the file again, get a bunch of `SSSSSSSSS` printed out

Wahoo! If you see a long string of `SSSSSSSSS`, you're doing great.

Here's what minitest results mean:

- `S` means "skip", and it means we "skipped" the test. (see all the words inside each method, that say "skip"? that's how we skip that test.)
- `E` means "error". the test couldn't run for some reason.
- `F` means "failure". the test ran, but didn't pass.
- `.` means "success". The test ran, and passed.

## 7. Make the whole file pass!

So, lets make the first test pass. Just watch the video where I do the first few tests.

Once you get the hang of it, try pausing the video and keep going on your own. Then unpause the video, compare the results, repeat. (But please do watch the video, at least this little section at [10:55 on using Pry from inside your tests](https://www.youtube.com/watch?v=BKqo2w0W7S0&t=654s))

<div class="container">
<iframe class="video" src="https://www.youtube.com/embed/aeAkLxr5diE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

----------------------------------------------------

# What next?

Go ahead and finish this file. When you're done, do the other test files in that `data-types` directory. 

Please read the `README.md` associated with every exercise.

These exercises (in order) are:

```shell
data-types/strings/strings.rb # you just finished this one
data-types/ints_and_floats.rb # do this next
data-types/collections/arrays.rb # then this
data-types/collections/hashes.rb # then this
data-types/collections/nested-collections.rb  # then this
data-types/advanced_nested_collections/nesting_test.rb # Then this. 
```

![next datatype](/images/2020-07-20-turing-int-and-float.jpg)

Once you start on `collections`, go read the associated guide I wrote: [Arrays, Hashes, and Nested Collections](https://josh.works/turing-backend-prep-arrays-hashes-nested-collections)

The chapters are a bit out of order. I'll fix that soon.

When you're done, feel free to move to the next chaptter, dealing with objects in Ruby!


{% include turing_prework_index.md %}

