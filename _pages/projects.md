---
layout: page
title: Projects
published: true
description: "I consider a project done when it's at about 70%, and has the capability to deliver value to others."
permalink: projects
image: ""
---

Originally, this page contained exclusively links to software projects/resources I'd made. Some of them were under active development, but I am working full-time again, _and_ have a baby, so my discretionary free time is diminished.

I don't mind this, though.

### 'Gardening' around Golden

This project is the hardest to define. My wife and I recently bought a rather old house for a rather large amount of money. We are really psyched on *Golden*, and this neighborhood and what we're close to and how fun it is here.

I'm trying many different small experiments, riding the trade-off between "costs little" in time, effort, and/or money and "guaranteed to be of high quality/solve the exact problem".

I'm drawn inexorably to attend to "the largest problems" in my life, so _currently_ the largest problems I face in Golden are:

1. Unsafe/inadequate mobility networks ("dangerous streets" and "congestion/traffic")
2. Issues downstream of "housing is extremely expensive"

I also spend time pursuing "having fun with friends", and that looks like lots of shared meals, or the occasional back-yard outdoor movie-night. (🤞 for more of that).

### Living an as-enjoyable-as-possible existence

The last few years have been _profoundly_ difficult, for everyone. Even before the pandemic, myself, family, and close friends were greatly affected by death and disease, and how quickly lives can change, with a diagnoses, a heart attack, an accident. I enjoy "banking joy", and am attuned to what kinds of things lead to joy, satisfaction, rest, laughter, peace, appreciation, and beauty.

### I am deeply concerned about beauty

Ugh. I need to expand on this in more depth. I care a lot about it. Beauty corresponds with so many good things (healthy ecosystems tend to be beautiful, for example) it's worth always pursuing along side whatever else you've got going on.

Create beauty, yes, but first be able to recognize it. [Beauty is closely related to wonder and curiosity](https://josh.works/driven-by-compression-progress-novelty-humor-interestingness-curiosity-creativity)

## Software projects

Here's a long list of links! Loosely ordered.

Some of them have options to buy things, some don't. Some are educational for others, some are educational just for me. The thread is that these are _finished products_ and can be discussed/evaluated as such.

I try to be biased towards finishing projects. To that end, here's a list of projects and products I've built.

This page is inspired by Tom Critchlow's [The Importance of Launching](https://tomcritchlow.com/2017/01/26/f-yeah-side-projects/)

These are ordered by recency, magnitude, or interestingness to myself. You might find archived/no-longer-active projects


### Mapping my strava activity data (primarily scooter rides)

I've got big plans with this concept. It's going to be an app that displays my full activity data from Strava, and will show exactly where I've ridden my scooter, and will auto-update daily. It currently doesn't auto-update:

[https://josh-strava-heatmap.herokuapp.com/](https://josh-strava-heatmap.herokuapp.com/)


### Intermediate Ruby

Are you an early-career software developer? Working on getting your first job, or you've been working for less than two years? I'll help you level up your software development skills.

👉 [https://intermediateruby.com/](https://intermediateruby.com/)

### How to Integrate Stripe and a Static Site

Have you ever wanted to add a very basic payment integration for something you're selling on your static website?

I sure have, and I found it particularly challenging, especially with multiple products/tiers (I.E. selling a $29 and $49 thing).

So, I figured it out, and you can sample the course, or buy it, here:

👉 [How to Integrate Stripe and a static site]({{ site.baseurl }}{% link _pages/stripe_course.md %})

### A Runbook for Upgrading Your Parent's Junky Old Laptop to a Chromebook

I spent many, many hours doing research on how to upgrade my mother-in-law's laptop from an old nearly-unusable Windows PC to a Chromebook.

> Why'd you want her on a Chromebook, Josh?

Because my wife and I are her primary tech support team, and she lives two time-zones away, and she often is frustrated by her computer, from printing things, to downloading attachments, and navigating the internet enough to follow along in the lives of her kids and grandkids.

A Chromebook has a _very_ easy-to-use "remote in" feature, so when she has a problem, she knows to click a button in the favorites bar, read me the code, and now I can see her screen _and_ control her computer. It's so easy to show her how to do things with this set of tools.

I'd lost many, many hours to trying to help her with poorer tools before.

👉 [A Runbook for Upgrading Your Parent's Junky Old Laptop to a Chromebook]({{ site.baseurl }}{% link _posts/2020-08-03-parents-guide-to-painless-chromebook-setup.md %})

### Intermediate Ruby Obstacle Course

This repo contains a collection of "obstacle courses" that are laser-focused on quickly leveling up very discrete skills.

👉 [Intermediate Ruby Obstacle Course](https://github.com/josh-works/intermediate_ruby_obstacle_course)

Currently, the only _finished_ obstacle course is [Web Scraping with Nokogiri Obstacle Course](https://github.com/josh-works/intermediate_ruby_obstacle_course/tree/main/nokogiri)

The information contained within the obstacle course is the "meat and potatoes" of how I built the next item:

### Discover a random personal blog from Hacker News

Evidence that this project does exactly what I hoped:

> Every time I visit it, I find a _delightful_ personal blog that I otherwise never would have found.

👉 [Discover a random personal blog from Hacker News](https://random-hn-blog.herokuapp.com/)

### Sidekiq and Background Jobs for Beginners

I cross-posted [this article to Medium](https://josh-works.medium.com/sidekiq-and-background-jobs-for-beginners-89c95fef786f) a while ago, and it gets a surprising amount of SEO-driven traffic. I'd like to expand this article into a short course at some point.

👉 [Sidekiq and Background Jobs for Beginners]({{ site.baseurl }}{% link _posts/2018-07-30-sidekiq_background_jobs_for_beginners.md %})

### An 8-part Guide to Preparing for Turing's Backend Program

Dozens of Turing students have said that this guide has been the reason they've been successful at Turing. That means, conservatively, this guide has delivered tens of thousands of dollars of value. A slightly more expansive definition of value (inclusive of opportunity cost and time) means this guide has delivered _hundreds of thousands of dollars of value_.

I'm proud of it. It's exactly what I wish I'd had before I attended Turing.

👉 [Chapter 1: Make Mod 1 Easier Than It Otherwise Would Be]({{ site.baseurl }}{% link _posts/2019-05-09-turing_prework_01_intro.md %})

### Power Broker Quotes

**Get One Quote from _The Power Broker_ in your inbox, every week**

As I work on email sending infrastructure professionally, I wanted a little playground to replicate some of the message sending infrastructure used at Homebot, like `rails`, `redis`, `sidekiq`, `twilio/sendgrid`.

One of my favorite books is _The Power Broker_ by Robert Caro. (I've written extensively about this book [here]({{ site.baseurl }}{% link _pages/robert-moses.md %}))

Anyway, the project is rapidly evolving, but there's a code-a-long available in the `readme`, from `rails new` to here.

- [https://github.com/josh-works/power-broker-quotes](https://github.com/josh-works/power-broker-quotes)
- [https://power-broker-quotes.herokuapp.com/](https://power-broker-quotes.herokuapp.com/)
