---
layout: post
title:  "Turing Prep Chapter 1: Make Mod 1 Easier Than It Otherwise Would Be"
description: "This guide will help you be successful at Turing and in your future new career as a software developer. It's often a difficult path, and you'll be regularly pushed well beyond your comfort zone. If you follow my instructions, you'll have a much easier and more successful time at Turing. (Part 1 of 8)"
date:  2019-05-09 06:00:00 -0700
crosspost_to_medium: true
categories: [turing]
tags: [programming, turing]
permalink: turing-backend-prep-01-intro
image: /images_2020/turing-prep-series-cover.jpg
issue_id: 4

---
{% include turing_prework_index.md %}

## Why this "ruby/backend-software-engineering prep series" exists

_This entire series has been a constant work-in-progress. I say that as I offer an explanation, and ask for your patience for the confusing and unclear bits ahead._

The information will be the best fit for someone who's finished Turing's [Mod 0 program](https://mod0.turing.io/) and the [Mod 0 capstone](https://github.com/turingschool-examples/module_0_capstone).

That said, if you get here before finishing (or even starting) the Mod 0 program, you can _probably_ self-serve your way to readiness for this guide, and the upcoming 8+ chapters, if you've got the right mix of available time and eagerness to finish this entire thing.  

As you spend time working through the resources you'll soon encounter, you will absolutely learn some tips and tricks and useful ideas, perspectives, mental models, that you wouldn't otherwise have learned at this point in your journey.

We'll accomplish these admittedly grand goals by by working on, (and completing) a collection of exercises, written in Ruby, which will require you to exercise quite a few skills to finish _even the first exercise_. 

These exercises _generally_ try to build from "very small step, with lots of support along the way" to "much larger steps, much less help, you will absolutely have to dig around more on your own, but this is a 'happy little accident'."

_**Warning: Footnote tutorial ahead 👉** Click/tap the little numbers, and the page will "jump" to the bottom, and at the end of the footnote, you can click another button that brings you back to the that same number. Practice it at least once!_[^thank-you]

[^thank-you]: Thank you! I made a very earnest request, you clicked the footnote, and now you're reading it. _OR_ you're reading this footnote because you read one of the _later_ footnotes, and noticed this one near it. _That counts too!_

There's many objections or questions that you could raise, right now, as you are reading these words. You're possibly on your phone[^i-would-never], but I'd ask that you give it a shot, next time you're sitting at your laptop.[^did-you-read-the-footnote] Read the rest of this article (or at least skim it!) _and_ get the first ruby exercise completed (`/data-types/strings.rb`), which is the topic of Chapter 2, and _I bet you'll feel proud of yourself in the next ten minutes of fiddling at your terminal._[^now-you-know]

[^i-would-never]: We must all admit that we all are on our phones in the bathrooms. Somewhere between "50% of the time" and "100%". No shame. High-quality reading time, sometimes!
[^did-you-read-the-footnote]: Did you read that previous footnote? I sometimes annotate my writing with footnotes. They're not always worth reading, but it's worth recognizing them.
[^now-you-know]: I bet you read _one_ of these footnotes. Got it! Now you know how they work! Click the number in the text above, and the page "jumps" down to this line of text. Click the funky arrow at the end of the footnote to return to where you started. Try it! Click the arrow: 

Some of you are already sold and are charging ahead, some of you are still hesitant, or don't take it seriously enough.[^cant-stop] 

If you spend 10 hours on this material, between now and when Turing starts, you'll be much improved from your baseline, and if you're doing Turing you're already committing _a lot_. Time, money, emotional energy, re-arranging your life for a while, _certainly_ thinking more about your financial situation and how much you can/want to spend on baby-sitting. 

If you think you can spend _more_ than ten hours on this work (perhaps you've stumbled across this resource weeks/months before Turing's starting!), you'll be pleased. 

To the more income/expense type persons[^thats-me]:

[^thats-me]: I absolutely bring a a "strong lens." to the world, but I'm not talking about bias, I'm talking about _webcomics_. Don't know what they are? Oh boy, you're in for a treat!

> The energy and focus you spend/invest in/on these resources, and working in your own terminal, editor, etc. will, over time, deliver incrementally more learning or less time, stress, and/or anxiety. 

## How much time should I put into this?

This can take as much or as little as you have to put into it. Start with a little, consider upping it to more. 

As little as a few short _but focused_ sessions spread over a few days could be great. If you can do more than that, and you've got weeks? Great! Try to finish this entire prep series, in detail, and watch all the walk-through videos, pausing them all a bunch of times as you go to play with code in your editor. You'll have a blast! 

However much time you allocate to this, please don't squish out _all_ of the stuff that gives life meaning. If you're able/willing/inclined:
- Go for walks
- talk with friends and family
- do the grocery shopping or take care of your kids for your partner who will be doing a lot more of it once Turing _actually_ starts
- Relax with a book (Maybe one of the books I'm about to recommend!)
- Do something physical


I'm not sure how much time this will all take. Like I said, 10 hours will make a big difference, 20 hours will permanently change your Turing experience. Budget 20 hours ± 5 hrs. You could do this in a long weekend, or a few evenings in a week, but you'll get the most time if you spread your efforts across at least two weeks, to give the material time to stew and soak in.

## If that's a reasonable amount of time, where do I get started?

Good question. The answer involves a long digression and tortured analogy on the topics of:

- screwdrivers
- how to learn hard things
- why you should "do drills" 

Yes, drills, like this:

<iframe src="https://giphy.com/embed/cOQBUfE46cdKP3lFNt" width="480" height="270" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/nba-cOQBUfE46cdKP3lFNt">via GIPHY</a></p>

By the end of this particular post, I have a few objectives for you:

1. Understand the importance of bringing the right _process_ to hard problems
2. Decide to read _A Mind for Numbers_ and _Deep Work_. 
3. Understand that spending a few dollars and hours _learning how to learn_ is a fantastic start to Turing prep, where you're spending a lot more than a few hours and few dollars to learn a difficult craft. 


## The right tools for the job

If I handed you a `Spax` screw, and told you I'd pay you $1000 to screw it into a piece of wood, and then handed you a Phillips screw driver, what would you do?

Spax screws look like this: 

![spax](/images/spax_small.jpg "A spax screw. Notice the shape of the head.")

_A spax screw. Notice the shape of the head._

One would use a Spax bit to drive the screw:

![spax bit](/images/spax_head.jpeg)

A philips screw bit looks like this:

![philips bit](/images/phillips-head-power-bits-196.jpg "Notice the shape of the head. This is shaped like a +, the spax is shaped like a *")

_Notice the shape of the head. This is shaped like a +, the spax is shaped like a *_

Philips bits are for driving philips screws, which look like this:

![philips screw](/images/Flat-Head-Thread-Forming-Screws-Type-F.jpg)

So, can you drive a Spax screw with a Philips bit? 

Not easily. 
<!--more-->

You could try really hard, use great effort, and end up damaging both the screw driver bit _and_ the screw, and probably barely get a single screw in. I bet, though, that you could get a single screw partially embedded in the wood. 

What if I were to pay you $1000 _per screw_ you could drive into the wood? 

Now you can't rely on just herculean effort, sleepless nights, and tenacity. 

_you have to have the Spax bit to drive a Spax screw._

For $1000 per screw, you could afford to buy the correct bit, and it would let you _effortlessly_ drive the screws. 

I'd argue it would be _irresponsible to not get the right tools_. 

The analogy should be clear - you're not being asked to drive screws, you're being asked to learn challenging and technical skills. Most of us didn't learn how to learn hard things in school, we figured out how to game the system and squeak by. 

Or, we didn't learn to game the system and we didn't squeak by. Did anyone else pick up some failing grades in high school and college. No? Just me? OK.

You need to learn software development, and you're probably going to put a lot of time and money into this goal.

*It could be considered irresponsible to not acquire the right kinds of tools for learning technical topics*

Obviously, you need the right physical tools; a laptop, functioning screen, etc. But you need the right knowledge. You need to _know how to learn hard things_.  

## The right _mental_ tools for the job: Tactics and Mindset

To learn hard things, you'll need:
1. Specific tactics
2. The correct mindset

### How to get the right tactics

To obtain the right tactics, and some of the mindset, I strongly recommend buying or renting a copy of [A Mind for Numbers: How to Excel at Math and Science (Even If You Flunked Algebra)](https://www.goodreads.com/book/show/18693655-a-mind-for-numbers). 

While you're waiting for Amazon to deliver the book, or to pick it up from the library, read these two summaries:

- [Faster to Master: Book Summary: “A Mind For Numbers”, Barbara Oakley](https://fastertomaster.com/a-mind-for-numbers-barbara-oakley/)
- [Karl Booklover: A mind for numbers — Summary](https://www.karlbooklover.com/a-mind-for-numbers-summary/)

_A Mind for Numbers_ talks about how to learn hard things. The author talks about mental models, "chunking" information to free up working memory, practice, drills, repetition, staying the right amount out of your comfort zone, doing hard things, avoiding distraction, procrastination, etc. 

Everything in that book is relevant to the rest of your career in software. Please read the book.

-------------------------------

I know most of you will not read the book, despite my strong suggestion and humble request that you do so. That's because _you don't yet trust me_. It's OK that you don't trust me, I'm just a random person on the internet, but I humbly ask that you _start trying to trust me_.[^trust-me]

[^trust-me]: It's not unreasonable to think:

    > Josh, you’re doing a lot of talking and making some bold claims. Why should I devote my scarce time and resources to doing what you suggest instead of all the other things I could be doing?

    Great question. Here's my answer:

    I’ve been helping Turing students prep for the backend program since I graduated Turing in August of 2017. I’ve worked with dozens-to-hundreds of Turing students.
    For the last few months, I’ve had phone conversations with every single student who’s had to repeat mod 1 of the backend program. Literally. 30 minutes, at least, during intermission week before they started mod 1 the second time, and once again, week six, after they found out they were moving on to mod 2. (so far, all have graduated the mod their second time around.)


If you're not going to read the book, you don't get to question my methodology for the rest of this guide. Accept the following truth:

*To learn hard things, you need to build mental models of the hard thing, and to build this mental model,   you need practice and repetition.*

Any individual or team that performs at a high level is on board with the value of "drilling" important things. Fire drills, drills for sports teams, drilling to practice something you'll be tested on - all of these are ways to make sure not only that you know how to do the right task, but _you can't get that task wrong_. 

So, working through these drills will move you in the same direction. You'll not just build a single new class from scratch, but you'll eventually do it so many times you can't help but _get it right every time_. 

This will make the rest of your time at Turing go much, much better. It could help save you from repeating a module.

If you _would_ repeat a module, but after doing these drills you don't, that's six weeks saved, plus a few thousand dollars, and the knowledge will serve you for the rest of your career as a developer. 

But don't take my word for it. Here's what other Turing students have said, after working through this guide:

>  I definitely feel over prepared in some aspects, but I'm trying to use it to help everyone get to the same levels of understanding

> It has been amazing and I feel like I learned so much from mythical_creatures...

> The mythical_creatures felt like it like brought everything together and how it works (on a kindergarten level) but made it all feel...real-ish in a way, and that was huge.

>  i swear to god, knowing what pry was and having done mythical creatures helped me so much here!

> At the end of week 2 I’m feeling way better than I anticipated i would jumping into all of this and I know it’s in large part because of your encouragement for folks to work through the ruby exercises and the videos to support being able to do those in the first place.

Here's what a student said, who _didn't_ follow this guide:

> I wish I’d done mythical creatures and more before. I really struggled in mod 1

### How to get the Right Mindset

Please read [Deep Work: Rules for Focused Success in a Distracted World](https://www.goodreads.com/book/show/25744928-deep-work)

_Deep Work_ pairs well with _A Mind for Numbers_ but will help round out some of the "why" of a program like Turing's. It was part of the reason that I went to Turing myself, and I wrote [Quitting the shallow for the deep](https://josh.works/i-quit) about changes I made to my life after reading _Deep Work_ and preparing for Turing.

I wrote that in October 2016. My how the time flies. 

These two books represent a modest investment of time and money. You're going to spend hundreds of hours over the next few months learning programming. $25 of books (or free, if you use a library) plus a few hours of reading may significantly impact the effectiveness of every one of those hours you're already planning on spending focused on programming.

> It could be considered irresponsible to not acquire the right kinds of tools for learning technical topics



## How you ought to approach drills

Both books talk about drills, and focused practice. We're familiar with the idea of drills in other domains (fire drills, sports drills) but it's rare to see the same kind of ideas ported over to "academic" pursuits. 

Well, here we are. If it's good enough for saving lives when the building is burning down, and for every professional athlete that's ever lived, it's good enough for us. 

We're doing drills. _Programming_ drills.

> Why would we do _programming_ drills, Josh? Isn't it just good enough to get some solution once, then move on to another problem?

There's lots of reasons for doing drills. If you want to get into the nitty gritty, know that they line up closely with the principles of [Deliberate Practice](https://jamesclear.com/deliberate-practice-theory) which is "how anyone can learn anything".

But for our purposes, here's why you should do drills:
- Relatively small and focused. You can knock out most of these in just a few minutes.
- Attack the same principle from many directions. You'll do lots of string manipulation, and you'll create classes and object "factories" a bunch of different times. They're similar enough to each other that the knowledge will reinforce itself, but different enough that you have to think hard.
- Force you to reveal and examine your own assumptions about how _your_ code works. You'll be writing a lot of code. You'll have to understand it pretty well by the time you're done.

There's more reasons, but we'll leave it at this.

## Conclusion

You should bring tools suited to the task at hand. If you need to drive Spax screws, bring a Spax screw bit. 

Read 
- [Mind for Numbers: How to Excel at Math and Science (Even If You Flunked Algebra)](https://www.goodreads.com/book/show/18693655-a-mind-for-numbers)
- [Deep Work: Rules for Focused Success in a Distracted World](https://www.goodreads.com/book/show/25744928-deep-work)

If you're not going to read the books, at least read these summaries:
- [Faster to Master: Book Summary: “A Mind For Numbers”, Barbara Oakley](https://fastertomaster.com/a-mind-for-numbers-barbara-oakley/)
- [Karl Booklover: A mind for numbers — Summary](https://www.karlbooklover.com/a-mind-for-numbers-summary/)
- [“Deep Work: Rules for Focused Success in a Distracted World” by Cal Newport (Book Summary)](https://www.njlifehacks.com/deep-work-cal-newport-summary/)
- [Deep Work by Cal Newport (book summary)](https://www.samuelthomasdavies.com/book-summaries/business/deep-work/)

Be swayed by other students who have worked through this guide and have felt very well prepared by it. They've saved themselves time, stress, sleepless nights, perhaps money, and much more. 

**what's next?**

Well, just click on over to chapter 2:

{% include turing_prework_index.md %}

### Footnotes 

[^cant-stop]: And some of you take it so seriously you read _every_ footnote. I know you exist, because I, the author, compulsively read every footnote I encounter in nearly any piece of text. 
    
    I know how damn useful they can be, but _also_ how useless they can be, and I wish an author would just be consistent. Don't drop mind-bending parenthetical footnotes that I have to flip pages/click things to read, _and_ a note that says "ibid"! I want the former, not the latter.
    
    Just know, if this describes you, I've got you, and the UI for jumping between footnotes and text in this document _isn't the worst thing that has ever existed_.