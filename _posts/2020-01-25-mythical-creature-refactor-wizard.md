---
layout: post
title:  "Mythical Creatures: Refactoring wizard.rb"
description: "Refactor practice, in which we will refactor wizard.rb, learn more about Ruby, object-oriented design, and clean code"
date:  2020-01-25 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [mythical_creatures, refactoring, ruby, turing]
permalink: mythical-creature-refactor-wizard
image: /images_2020/turing-prep-series-cover.jpg
---

{% include turing_prework_index.md %}

Today we're refactoring some code.

I find it _extremely_ fruitful when others look over my code and help me clean it up. Quite a few Turing students have told me that the process of refactoring their own code with the help of someone who knows a bit more than them has been super helpful.

This is an exercise from Turing School's [ruby-exercises](https://github.com/turingschool/ruby-exercises) repository. 

Specifically, we're refactoring a solution that makes [this test](https://github.com/turingschool/ruby-exercises/blob/master/mythical-creatures/test/wizard_test.rb) pass. 

## How to get the maximum value from this exercise

So far, I've found it most helpful to have _my own_ code refactored. I wish I could help every single person who might read this post refactor _their own code_. 

But I cannot. 

But here's the thing - when you're working, you'll often not be refactoring your own code either. It's most likely you'll be reading (and updating) code that someone else wrote. 

Or you'll be nestling in new code and new features alongside existing code and existing features. 

So it's useful to get practice reading other people's code, and being able to work with it. 

# Video Walk-through

Sometimes video walk-throughs are helpful, so I put one together. It is 7 minutes long, and covers useful material.

<div class="container">
<iframe class="video" src="https://www.youtube.com/embed/HfBrRb1LLSY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

<!--more-->


Copy-paste this code into your editor and run the tests:

```ruby
# ruby-exercises/mythical-creatures/wizard.rb
class Wizard
  attr_reader :name
  def initialize(name, bearded: false)
    @name = name
    @rested = 0
  end
  def bearded?
    if name == "Ben"
      true
    else
      false
    end
  end
  def incantation(saying)
    "sudo " + saying
  end
  def rested?
    if @rested >= 3
      false
    else
      true
    end
  end
  def cast
    @rested += 1
    "MAGIC MISSILE!"
  end
end
```

The tests should pass. 

We're going to cover a few things:
- Guard Clauses
- Default variables
- Running _just a single test from a test file instead of the whole thing_
- Sometimes simple things go wrong and are deeply frustrating

### Guard Clauses

Here's the guard clauses I mention: [guard clauses (thechrisoshow.com)](https://www.thechrisoshow.com/2009/02/16/using-guard-clauses-in-your-ruby-code/)

### Default variables

the test `wizard are bearded by default` implies that in the `initialization` method, we should set `bearded` equal to `true`, rather than false.

### Run just a specific test in a test file (Minitest)

Sometimes it's helpful to run just a single test in a test file, rather than the whole thing. 

Here's the format:

```
ruby something_test.rb --name=/a-string-that-matches-something-in-the-test-you-want-to-run/
```

instead of `--name=/abc/`, you can use `-n=/abc`. I'll often append the string `zzz` to the test I want to run, then append `-n/zzz/` to the test running command. (With `rspec` you can identify test by line number.)

### Things go so, so wrong

The video walk-through was my _second_ time recording the video, because I'd wandered so much in my explanations in the first video. 

Then, mid-way through the video, I closed the terminal window, CD'd into the wrong directory, and got a bunch of errors. I got it fixed, then fat-fingered my way back into closing the terminal. I was super frustrated. 

I'm ostensibly a "professional", in that I get paid to "develop software", but I thought it a useful reminder that we all do things that are frustrating and cause us to waste time. When you do this yourself, don't worry about it to much. Our entire craft is hard. [Reality has a surprising amount of detail](http://johnsalvatier.org/blog/2017/reality-has-a-surprising-amount-of-detail) and it's annoying when we get bit by that detail. 

Here's the final version:

```ruby
class Wizard
  attr_reader :name, :bearded, :rested, :spell_counter
  def initialize(name, bearded: true)
    @name = name
    @rested = true
    @bearded = bearded
    @spell_counter = 0
  end
  
  def bearded?
    bearded
  end
  
  def incantation(saying)
    "sudo " + saying
  end
  
  def rested?
    return false if spell_counter >= 3 # this is a "guard clause", sorta
    rested
  end
  
  def cast
    @spell_counter += 1
    "MAGIC MISSILE!"
  end
end
```

{% include turing_prework_index.md %}
