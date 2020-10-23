---
layout: post
title:  "Turing Prep Chapter 3: Moar Mythical Creatures"
date:  2019-05-31 06:00:00 -0700
crosspost_to_medium: false
categories: [turing]
tags: [programming, turing]
permalink: turing-backend-prep-mythical-creatures
image: /images_2020/turing-prep-series-cover.jpg
---

{% include turing_prework_index.md %}

I've made a few more videos, focusing on the Mythical Creatures exercises. 


## Mythical Creatures: `unicorn.rb`

Once you've finished the strings, arrays, hashes, etc... you may want to take a spin at the infamous Mythical Creatures!

These exercises will give you lots of practice with "object oriented" programming. You will define an object (like a `Person` object) and create instances of that object that have certain behaviors and methods of interaction. 

This is a lot to wrap your head around, and "object oriented programming" is a topic that fills dozens of books, hundreds of conference talks, and you'll spend the rest of your life building a better understanding of. So don't feel any rush to grasp it all in the next ten minutes.

Block out an hour or two to work through through this guide: [LaunchSchool: The Object Model](https://launchschool.com/books/oo_ruby/read/the_object_model)

Read it carefully, but don't worry that it all won't make sense. Take notes, run the code examples, take your time. 

**When, and only when, you've read through the above set of articles about `The Object Model` may you start to tackle the first mythical creature.**

**Do not watch the following walk-through until you've read and run code from `The Object Model` linked above.**

It can be tricky getting set up, so here's another video of the very first mythical creature:

A quick aside - as you work through these exercises, and all of the exercises to come, you'll perhaps notice a constant tension between "results" vs. "process". Here's what I mean by this, explained in a conversation with a Turing student, working through this exact guide:

They said:
>  [...] In other words, there is more than one way to achieve the result, so do I focus on process or product?  I am not expecting there to be a single “right” answer, but I am curious as to how Turing is going to evaluate us. Are the steps used more important than the outcome?

I responded with:

> Your intuition is leading you well - the steps _and_ the outcome, are important.
>
> I'd recommend de-emphasizing the Turing evaluations in your mind, though, and just focusing on building the right kind of skills that will serve you well for the rest of your career as a developer. And, from that lens, there will _always_ be tension between
> **the best I know how to do _right now_** and **the best that can be done, ever**.
>
> Obviously, as you grow your skill-set as a developer, you would be able to go back and improve prior bits of code you've written. It's rare to crank out a "perfect" project, no matter how small.
>
> So, optimize for learning, which basically means... when you find something that works, use it, but next time you come across a similar kind of challenge, you might use something slightly different.
>
> I don't know if any of this makes sense. It basically means
> **don't sweat not getting exposed to every single Ruby method, but be open to using new ones as situations arise, and you get more comfortable with the ones you know.**

Or, in summary:

> There may be multiple ways to achieve the required outcome; use what you now know; be on the lookout for other methods that achieve the same result.
 
 
<div class="container">
<iframe class="video" src="https://www.youtube.com/embed/mocwGsu41yw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

<!--more-->


Feel free to rely heavily on my solution here in the video, but when you're done making it pass the first time, you _must_ delete all the code (and the file containing the code), and do the exercise a second time, from scratch.

If you don't, you will get maybe 10% of the learning out of this exercise that you should. I made this video not to give you the solution, but to help you get the shape of running the drills. Now that you know the shape (from the video) you can do the drills, but you must re-build `unicorn.rb`, if you made it pass while watching my guide.

Once you've re-built your own `Unicorn` class, re-read the Object-Oriented guide: [https://launchschool.com/books/oo_ruby/read/the_object_model](https://launchschool.com/books/oo_ruby/read/the_object_model)

Much more of it will make sense to you this time. 

## Mythical creatures, `dragon.rb`

We're doing another Mythical Creature - this time, `dragon.rb`. I'll get a bit deeper into using Pry, as well as opening with a very minor (but very important!) Terminal modification.

<div class="container">
<iframe class="video" src="https://www.youtube.com/embed/NIPerY-xuCk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>
  
We discuss: 

- Setting new tabs/windows in Terminal to open from current directory. ([more on this](https://apple.stackexchange.com/questions/178017/new-terminal-to-same-directory))
- Atom split panes ([more](https://flight-manual.atom.io/using-atom/sections/panes/))
- Atom Autosave package: It's in your editor by default. [here's how to turn it on](https://stackoverflow.com/questions/29902834/auto-save-in-atom-editor)
- Atom package that shows current indentation: (vertical white lines) [indent-guide-improved](https://atom.io/packages/indent-guide-improved)
- Atom package that highlights beginning/end of method: [ruby-block](https://atom.io/packages/ruby-block)
- Atom package that highlightes all instances of selected text: [highlight-selected](https://atom.io/packages/highlight-selected)
- How to run just a single test in Minitest: [StackOverflow answer](https://stackoverflow.com/a/9310490/3210178)
- how to run just a single test at a time from the command line
- calling `self` inside of Pry, to see the current object under test. 

--------------------------------------------------


# Mythical creatures, `hobbit.rb`

The `hobbit` mythical creature is a bit tricky. We have to start _doing things_ with methods, without necessarily _returning_ anything. Then we have to "interrogate" the object under test to see what has changed, and if some things have changed in a certain way, we do one thing, if not, another.


<div class="container">
<iframe class="video" src="https://www.youtube.com/embed/uYGS-DCNR-0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>


IF YOU HAVE QUESTIONS! Email me, or ping me in the Turing slack channel (I'm `@josh_t`). I'll make sure to integrate answers to your questions into this guide.

-----------------------------------

When you're done, move on to chapter 4!

{% include turing_prework_index.md %}



### Additional resources
 - [JumpStart Labs: Objects and Methods](http://tutorials.jumpstartlab.com/academy/workshops/objects_and_methods.html) This is a good companion piece to the above OO articles
 - [LaunchSchool: The Object Model](https://launchschool.com/books/oo_ruby/read/the_object_model)
 - [LaunchSchool: Assert Yourself (an introduction to minitest)](https://launchschool.com/blog/assert-yourself-an-introduction-to-minitest)
 - [another one of my gists: terminal command summaries, tab-complete git branches, and a better terminal prompt (with video)](https://gist.github.com/josh-works/7f2e6c82d22dca6e9fbc029c8b17703d)

