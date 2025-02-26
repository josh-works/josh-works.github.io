---
layout: post
title: On Magic, and Magic Strings
published: true
description: "I think I believe in magic, and you might too. A proposed frame of evaluating an issue"
date:  2025-02-26 06:00:00 -0700
categories: []
tags: [programming, ethnic_cleansing]
permalink: /on-magic-strings
issue_id: 97
---

## Introduction 

v drafty, but wanted to get this out today.

I'm publishing two pieces today, this piece you're reading now is vastly more important than the other one, but it might be worth the click: [On Peeing]({{ site.baseurl  }}{% link _posts/2025-02-25-on-peeing.md %}). It's very different than this one.

I've long had a central organizing principal of my life oriented around the concept of "Magic Strings". 

A string being defined from the programming point of view. A collection of text characters, as opposed to an array, a float, an integer, a boolean. `True` is a boolean value, `"True"` is a string containing the stringy characters `T`, `r`, `u`, and `e`. 

Don't believe me? If you're on a mac, open your terminal, type `irb`, hit return (you're now in a ruby interpreter) and type `"string".class`. The return value will be `String`. Windows-machine-using people can use an online ruby interpreter like [replit](https://replit.com/languages/ruby.)

In this world, today, 2025, I believe it's goverend by real energies that animate real things, and some of the things governing the world are _strings_. 


## Real examples of almost/maybe magic, contained in strings

Patio11's [Dropping hashes: an idiom used to demonstrate provenance of documents](https://www.kalzumeus.com/essays/dropping-hashes/)

GUIDs, or 'Globally Unique ID' [wikipedia](https://en.wikipedia.org/wiki/Universally_unique_identifier)

> While the probability that a UUID will be duplicated is not zero, it is generally considered close enough to zero to be negligible.

The second part of that sentance is a _big deal_. 

Between hashing documents and GUIDs/UUIDs, I think it's easy to say there is _real magic_ being accessed. It's sorta mathy magic, and I see it as magic. 

So, by this definition, if _this_ is magic, I believe _all the way_ in magic.

But this isn't the only form of string magic I believe in.

## Magic strings in computer systems

Next, to upgrade the magic, I'll explain why strings pick up magical properties in computer systems. Lots of processes/objects/rows in databases are accompanied by a UUID, so if you're trying to trace the completion of a process across systems, if, _if_ you can find the right magic string (or you can create the right magic string _now_ for a future version of you to find, then), you can follow a process through time.

Imagine someone using a system requests an export of some data. A computer system might log something like `export 2a621613-9d65-4443-b662-547eb2ac715c starting...'

and then dispatch that request to other systems that compile the data, build the CSV, wait till it's done, emails the customer that the report is ready, etc. And so you can search your whole logs for that string, `2a621613-9d65-4443-b662-547eb2ac715c`, and anytime you find it, you know it has to do with that original process. 

It can be like magic.

Next, magic strings can be found as 'sha's. We discussed 'dropping hashes' above, or Patrick Mckenzie did. One uses that concept everywhere. Hunting through a git repo for a certain sha, looking through a codebase for a certain class name, looking through the ongoing, running system for certain instances of that class name or certain strings...

so much of the job of a software developer is mediated by an ability to see value in an otherwise seemingly arbitrary collection of symbols. 

## Magic strings in archival documents

So, again, software development is often-enough 'reading code', so I'm used to looking through things that are old, or older versions of things that are newer. Sometimes 'older versions' means 'a week ago', sometimes it means 'a decade ago', sometimes much older.

A sure, sure sign of something that matters _now_ having been placed in a document _then_ is if it has sufficient randomness _and_ is visible in the document then. Here's some examples of sufficiently random things that if you find them now AND THEN you know it existed then:

```
2a621613-9d65-4443-b662-547eb2ac715c
ea306dbfe385d5fe9710ac98b514ffba547fc4bb
271b9a
```

Any of these, including the last one, contains way more than enough randomness to be useful. 

## Where we take a turn into ethnic cleansing

Who's surprised that this is taking a turn into genocide, murder, war?

Here's some other numbers that I think are close enough to magic strings:

```
35, 50, 100, 150 (feet tall)
2.5, 2 1/2 (stories tall)
625, 1250, 5000 (square feet)
R1, R2, R3 (race/residence zone)
U1 (dwelling house district) U2 (apartment house district)
```

These are some of the documents contained inside of [this other document, a 1922 document originating zoning in the USA](https://josh.works/full-copy-of-1922-atlanta-zone-plan#height-districts)

Look up any zoning code today, and you'll see it full of references like:

```
up to a maximum height of 35’
6,000 sf 
```

to read the 1922 document is to find a lot of phrases that hit different when you see them cropping up over and over, like in 1926, when a legal body in the usa approved the government's use of ['zoning' in euclid v. ambler](https://supreme.justia.com/cases/federal/us/272/365/)

Here's some quotes from that judgement:

> With particular reference to apartment houses, it is pointed out that the development of detached house sections is greatly retarded by the coming of apartment houses, which has sometimes resulted in destroying the entire section for private house purposes; that, in such sections, very often the apartment house is a mere parasite, constructed in order to take advantage of the open spaces and attractive surroundings created by the residential character of the district. 
> 
> Moreover, the coming of one apartment house is followed by others, interfering by their height and bulk with the free circulation of air and monopolizing the rays of the sun which otherwise would fall upon the smaller homes, and bringing, as their necessary accompaniments, the disturbing noises incident to increased traffic and business, and the occupation, by means of moving and parked automobiles, of larger portions of the streets, thus detracting from their safety and depriving children of the privilege of quiet and open spaces for play, enjoyed by those in more favored localities -- until, finally, the residential character of the neighborhood and its desirability as a place of detached residences are utterly destroyed.

holy run-on sentance. Seem familiar?

That U-1. Where do you think it came from?

> The court below seemed to think that the frontage of this property on Euclid Avenue to a depth of 150 feet came under U-1 district and was available only for ...

And that's how america legalized ethnic cleansing. Because the person that wrote the 1922 document, elsewhere in that document, said:

> Care has been taken to prevent discrimination and to provide adequate space for the expansion of the housing areas of each race _without encroaching on the areas now occupied by the other_. [emphasis mine]

We all live now in a world fully mediated by someone trying to create 'slave housing' and 'ghettos', and doing so successfully.

No wonder everyone's 'mental health' in america is shit. 


