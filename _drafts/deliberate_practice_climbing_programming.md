---
layout: post
title:  "Deliberate Practice in Programming"
date:  2017-12-26 06:00:00 -0700
crosspost_to_medium: false
categories: [deliberate_practice]
tags: [programming, deliberate_practice]
permalink: this-post-url
---

For the last year or two, I've been obsessed with the idea of deliberate practice.

primary domains i want to apply it in: climbing and programming

# what is deliberate practice?

- anders definition (author of PEAK)
- requirements for an activity to count as deliberate practice

<!--more-->


# What isnt deliberate practice?

- mindless repetition
- inside your comfort zone


# Programming and Deliberate Practice

There's many challenges to applying the concepts of deliberate practice to programming. 

First, being a good _software developer_ is more than just knowing how to use a given programming language. Further, you can write "good code" in one way that might be "bad code", if viewed from another direction. There's _many books_ written about writing good Object Oriented code, or Functional code, or this, or that. There's no objective standard of "this is the best code that can be written."

That all said, _good developers exist and can be distinguished from less skilled developers_. At least part of this difference is _good developers more quickly write better code_. 

I'm not yet a good enough developer for fine-grained analysis of differences between "great developers" and "regular developers" to be relevant to me. I'm just trying to be a "better" developer, and I think some of the principles of Deliberate Practice can help me. 

So, this caviat aside, there are a few places I could see Deliberate Practice intersecting with the field of software development:

#### "practice" in general 

(I.e. [the slope is more important than y-intercept]( {{ site.baseurl }}{% link _posts/2015-06-26-2015-6-25-a-little-bit-of-slope-makes-up-for-a-lot-of-y-intercept.md %}))

#### avdi & MooM 

(Avdi... someone or another... has a course on "Mastering the Object Oriented Mindset". This might not be "deliberate practice", but it's helping me become a better developer.)

#### [Practical Object Oriented Design in Ruby](URL), by Sandi Metz

This is a great way to absorb principles of Object-Oriented design, and as I work through the book, I'm learning more about the Ruby programming language.


#### exercism.io 

Exercisms are, so far, the closest programming-related practice I know if that approaches Deliberate Practice. 

# Are these things actually programming-specific deliberate practice?

perhaps all of the above is either:
- a distraction from actual improvement
- fundamental building blocks, like learning chords for playing the piano?


#### Resources (And an extensive detour)

I don't know if any of the following counts, but it's certainly practice in some capacity:

Regex is an important piece of what a developer does. My Regex skills are poor. While writing this article, I realized "I don't know if I always make my 'resources' header an h3 or an h4. I think it should be an h4."

My text editor lets me do a global regex search - I should be able to easily find every instance of text that looks like `### resources` (no matter how many `#` there are, or capital/lower-case `r`). 

This was my first search attempt:

`#+3\S+1Resources`. Nothing.

`#.Resources` turned up results! It matches the string `# Resources`, but not `### Resources`. Lets keep playing.

`#+3.Resources` back to 0. (I was trying to specify the count of `#` to match. Invalid syntax.)

`#+.Resources` Better! Now we have any number of `###`, followed by any character (usually a space) followed by `Resources`. 

Lets make sure it only matches the beginning of the string, and not, say `la la la ### Resources`.

Further learning: in `#{3}.Resources`, the `{3}` is the quantity of the preceeding character it should match. No more, no less. 

Modify it to `#{3,}.Resources`, and the comma says "match three _or more_ of the preceeding character"

Adding the "start of string" operator doesn't work: `\A#{3,}.Resources` I suspect it's because these strings are embedded in the middle of a markdown file, and not at the beginning of the string. 

I felt good about adding the newline operator: `\n#{3,}.Resources`, but that still returns nothing. 

Ditto with "Carriage return": `\r#{3,}.Resources`. 

I'm going to leave this for now. `#{3,}.Resources` is sufficient. Some of this is going to go into Anki, so I can slowly build up my mental model of regex usage!

### Resources take two:

- [Peak: The Science of Human Achievement (book by the guy that created the phrase "deliberate practice")](url_here)
- [Deliberate Practice Auther in podcasts? Maybe Farnam Street Blog]
- [Deliberate Practice in Programming](blog post?)