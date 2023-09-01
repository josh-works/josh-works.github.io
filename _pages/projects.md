---
layout: page
title: Projects
published: true
description: "I consider a project done when it's at about 70%, and has the capability to deliver value to others."
permalink: projects
image: ""
---

Originally, this page contained exclusively links to active software projects/resources I'd made. It now also includes no-longer-active projects.

Some of these projects take place entirely off-line. Some of this is work related, some of it is purely for the challenge and edification of trying to bring something into existance. Some of these projects function as a 'friend-and-work catcher'. 

I have small and large projects that have worked, and failed. I have learned from all of them, and learning is one of the main things I optomize for. [^learn]

[^learn]: Technically, we all optomize for something like learning, and [when we're doing so in a healthy way, we're having a really good time](https://josh.works/driven-by-compression-progress-novelty-humor-interestingness-curiosity-creativity). 

### Robert Moses Hype Man

Robert Moses is a rather under-appreciated figure in American history. He's why American cities look the way they look, and he's responsible for lots of behavior that's amounted to 'regimes of ethnic cleansing'. 

The best starting point is an incredible book titled "The Power Broker: Robert Moses and the Fall of New York"

I wrote a page about him, and some quotes from the book, here:

👉 [Indulge me for a minute while I try to convince you to spend a few minutes deciding if you'll read this book or not](https://josh.works/robert-moses)
2. Seeing more detail in the world around you (like being able to recognize the signs of urban renewal and redlining, at a glance)
3. A good-enough handle on various forms of ethnic cleansing and supremacy thinking



_2022_

As I work on email sending infrastructure professionally, I wanted a little playground to replicate some of the message sending infrastructure used at many, many organizations, like `rails`, `redis`, `sidekiq`, `twilio/sendgrid`.

One of my favorite books is _The Power Broker_ by Robert Caro. (I've written extensively about this book [here]({{ site.baseurl }}{% link _pages/robert-moses.md %}))

Anyway, the project is rapidly evolving, but there's a code-a-long available in the `readme`, from `rails new` to here.

- [https://github.com/josh-works/power-broker-quotes](https://github.com/josh-works/power-broker-quotes)
- Here's [an exceprt of _The Power Broker_, chapter 30]({{ site.baseurl }}{% link _posts/2023-08-05-power-broker-ch-30-impy.md %}), about Moses' casual exertion of total control of a NYC Mayor that you've (probably) never heard of. Is it relevant? You tell me.

## Making hard-to-see data visible

_2021-current_

I built a little app to visualize certain mobility data I've collected as 'activities' in Strava, which I then can pull out via Strava's API.

What started as tracking marathon training eventually grew to me now tracking *most* of my scooter-riding, and I get almost all of it. 

So, this data is in large part a map of everywhere I've been, for several years. The data is both rather personal and semi-pseudo-obfuscated. Some of that is due to me not being able to easily-enough add that functionality in the time I've given this, some of it is a willful choice. 

current iteration: [https://mobility-data.herokuapp.com/](https://mobility-data.herokuapp.com/)

_pictures/gifs to come. It's worth a click, I think_

an older iteration: [https://josh-strava-heatmap.herokuapp.com/](https://josh-strava-heatmap.herokuapp.com/)

## Explaining that there are alterative land use governance models

_2023-current_

Of course, it's a substack:

[Zoning Very Different Than Ours](https://zoningverydifferentthanours.substack.com/p/introduction-land-use-regimes-very)

## 'Gardening' around Golden 

_2017-2022_

This project is the hardest to define. 

I lived in Golden from 2016-2022, first renting a condo, and at another point owning a rather old house for a rather large amount of money, and was enthusiastic on various projects in and around Golden. I poured myself hard into a bunch of projects around the city, and still consider it to be time well spent. 

As explained later, I care about beautiful places, and Golden is a *beautiful* place. As beautiful (in my opinion) as any place in the USA, and in many ways a delightful place to live.

In other ways, it was a frustrating place to live, especially when it came to trying to get the municipal government to stop coercing terrible solutions to solvable problems, on everyone/everything that interacts with Golden. [^other-reasons]

[^other-reasons]: there's lots of reasons to live in Golden. The finances of it right now are ~strange~ expensive, bad for everyone, and probably you shouldn't try to live in Golden until it feels "cheap" and "right-sized" in meaningful ways.

I tried many different small experiments, riding the trade-off between "costs little-enough" in time, effort, and/or money and "likely-enough to be of high quality/solve at least part of the problem".

This constant evaluation of experiments and trade offs was made unavoidably visible when I ran for city council in 2017. I had long thought about making things different or better, and my understandings and experiences, and the context of the time, made that a fun use of time. [^golden-city-council]

[^golden-city-council]: I told people, when they said "why are you running for city council?":

    > well, I just finished a trade school, so i'm taking some time to get my first job, turns out the rules of the city say I'm eligible, and this is more entertaining to me than sitting on the couch in my boxers playing video games, not that there's anything wrong with that. 

    I overall strongly disliked the experience, and found it to be extremely time/energy consumptive, even though I barely put time/effort into it. It felt de-dignifying to take the whole thing seriously, and I couldn't hide my contempt for the whole thing very well. For example, when reading an early draft of a campaign flier, a reviewer said "I absolutly, positively, would never let anyone ever see this.". I published it. I also was on a six-week climbing trip to the NRG during 'campaign season'. Anyway, my 10% haul on the election night is... not zero. 

I kept iterating. 

I didn't get on city council, but what about becoming friends with the folks who *were* on city council? The city staff themselves? Random people around Golden? I took a sabbatical from work and sorta took on a journalist or academic internship path. 

Eventually, once we owned a house in the city, and I'd read a bit more about how [politically powerful white americans use zoning laws and road networks to enforce regimes of social control and accomplish (where necessary) ethnic cleansing](https://www.goodreads.com/book/show/2023854.The_Slaughter_of_Cities) my meandering got even more focused.

Living in Golden, there were about 500 different manifestations of ethnic cleansing visible in the built environment around me.

For example, I started observing a rather dangerous street that went right past the house I lived in - I got to life a full life just a few meters from a 'standard arterial' in America, and believe you me, I was not a passive and unobservant participant in the street traffic. 

'standard arterials' were the foremost tool of eugenicists to attempt to cut off and cut through ethnic neighborhoods in urban areas in the 1950s. I hold these roads, and those who build them and support them, with a mix of contempt, disappointed sadness, and rage.

This all materialized as me caring a lot about:

1. inadequately-performant mobility networks[^performant-mobility-network]
2. issues upstream of "housing generally feels expensive".

[^performant-mobility-network]: An adequate network would accomplish two things:

    1. being safe-enough to the users of said network (dangerous streets/vehicle accidents)
    2. being consistent-enough for those users. congestion/traffic/safety in the normal expected conditions, like: 'night times' 'rainy times' and 'snowy times' and more


I also spent time pursuing "having fun with friends", and that looks like lots of shared meals, or the occasional back-yard outdoor movie-night, climbing trip, book club, and more. 

_I ended up moving out of Golden in 2021. I could see returning some day. 'Interesting things' continue to happen, continuously, all over Golden and Denver._


## thinking & writing about 'wonderful/beautiful places'

_2018-present_

This became a visible, legible goal to me in 2018, when a few of the last pieces clicked into my brain about healthy and beautiful places, at least as a conceptual compression for 'other legible and less-legible good things'.


I care about places, primarly. I don't mind ugly ones, but I'd rather be able to influence and nudge it towards beauty.

For example, beautiful cities, beautiful trees, beautiful parks, beautiful buildings, beautiful paths. Of course, beautiful indoor places. 

I give myself permission to care so much without shame, because a place being beautiful corresponds with so many other good things. healthy ecosystems tend to be beautiful, for example. it's worth always pursuing along side whatever else you've got going on.

For a lot of my life, I couldn't really articulate why I felt so strongly about beauty, but then I got better words. Then I got better at perceiving it.

If you wanted to expend energy getting better at perceiving it, you might start by reading the paper discussed here: [Beauty is closely related to wonder and curiosity](https://josh.works/driven-by-compression-progress-novelty-humor-interestingness-curiosity-creativity)

Next, as beauty relates to outdoor and indoor spaces, that which is beautiful is often an elegant solution to a problem faced in that particular place, one could and should spend some time with the late Christopher Alexander's "pattern language" concepts. 

1. [A Pattern Language: Towns, Buildings, Construction](https://www.amazon.com/Pattern-Language-Buildings-Construction-Environmental/dp/0195019199)
2. [The Timeless Way of Building](https://www.amazon.com/Timeless-Way-Building-Christopher-Alexander/dp/0195024028/ref=pd_bxgy_sccl_1/144-1216185-6526842?pd_rd_w=DshvC&content-id=amzn1.sym.7757a8b5-874e-4a67-9d85-54ed32f01737&pf_rd_p=7757a8b5-874e-4a67-9d85-54ed32f01737&pf_rd_r=V2PSNKFRV1FHPZP3H4BW&pd_rd_wg=qOa8d&pd_rd_r=a46fbe02-fb2f-49e9-a3e8-cc8277ff3b66&pd_rd_i=0195024028&psc=1)

Perhaps grossly oversimplified, he says things that could be boiled down to:

- iterative planning processes can properly solve all of the physical problems encountered in the area. 
- if the whole problem seems intractable, perhaps start by agreeing to clean it up as much as feels reasonable, and then agree to spend some time _in that physical space_ across at least a few times of day and year. 
- the more problems we solve in physical space, the more the space approximates 'a beautiful place'

These are "primary motivating concerns" for me. I'm happy to spend time and effort on projects related to physical spaces becoming beautiful.[^beauty]

[^beauty]: Incidentally, I don't consider myself to be super strong at "creating beauty", but I am pretty good at making places clean, appropriately and enjoyably and easily illuminated, and safe enough for at least a youngish-kid to exist inside of and be easily kept safe by a responsible adult. Once this has all been accomplished, there tends to be at least the outline of beauty emerging, and it's a good-enough start towards making something actually beautiful, like a quirky piece of art, or a specific garden/installation of something natural

    Additionally, I perceive danger from vehicles like cars and trucks, and generally do not find vehicle infrastructure to be beautiful. 


# Software projects

Here's a long list of links! Loosely ordered.

Some of them have options to buy things, some don't. Some are educational for others, some are educational just for me. The thread is that these are _finished products_ and can be discussed/evaluated as such.

I try to be biased towards finishing projects. To that end, here's a list of projects and products I've built.

This page is inspired by Tom Critchlow's [The Importance of Launching](https://tomcritchlow.com/2017/01/26/f-yeah-side-projects/)

These are ordered by recency, magnitude, or interestingness to myself. You might find archived/no-longer-active projects

## Intermediate Ruby

_2020-2021_

Are you an early-career software developer? Working on getting your first job, or you've been working for less than two years? I'll help you level up your software development skills.

👉 [https://intermediateruby.com/](https://intermediateruby.com/)

## How to Integrate Stripe and a Static Site

_2019_

Have you ever wanted to add a very basic payment integration for something you're selling on your static website?

I sure have, and I found it particularly challenging, especially with multiple products/tiers (I.E. selling a $29 and $49 thing).

So, I figured it out, and you can sample the course, or buy it, here:

👉 [How to Integrate Stripe and a static site]({{ site.baseurl }}{% link _pages/stripe_course.md %})

### A Runbook for Upgrading Your Parent's Junky Old Laptop to a Chromebook

_2020_

I spent many, many hours doing research on how to upgrade my mother-in-law's laptop from an old nearly-unusable Windows PC to a Chromebook.

> Why'd you want her on a Chromebook, Josh?

Because my wife and I are her primary tech support team, and she lives two time-zones away, and she often is frustrated by her computer, from printing things, to downloading attachments, and navigating the internet enough to follow along in the lives of her kids and grandkids.

A Chromebook has a _very_ easy-to-use "remote in" feature, so when she has a problem, she knows to click a button in the favorites bar, read me the code, and now I can see her screen _and_ control her computer. It's so easy to show her how to do things with this set of tools.

I'd lost many, many hours to trying to help her with poorer tools before.

👉 [A Runbook for Upgrading Your Parent's Junky Old Laptop to a Chromebook]({{ site.baseurl }}{% link _posts/2020-08-03-parents-guide-to-painless-chromebook-setup.md %})

### Intermediate Ruby Obstacle Course

_2020_

This repo contains a collection of "obstacle courses" that are laser-focused on quickly leveling up very discrete skills.

👉 [Intermediate Ruby Obstacle Course](https://github.com/josh-works/intermediate_ruby_obstacle_course)

Currently, the only _finished_ obstacle course is [Web Scraping with Nokogiri Obstacle Course](https://github.com/josh-works/intermediate_ruby_obstacle_course/tree/main/nokogiri)

The information contained within the obstacle course is the "meat and potatoes" of how I built the next item:

### Discover a random personal blog from Hacker News

_2020_

Evidence that this project does exactly what I hoped:

> Every time I visit it, I find a _delightful_ personal blog that I otherwise never would have found.

👉 [Discover a random personal blog from Hacker News](https://random-hn-blog.herokuapp.com/)

### Sidekiq and Background Jobs for Beginners

_2019_

I cross-posted [this article to Medium](https://josh-works.medium.com/sidekiq-and-background-jobs-for-beginners-89c95fef786f) a while ago, and it gets a surprising amount of SEO-driven traffic. I'd like to expand this article into a short course at some point.

👉 [Sidekiq and Background Jobs for Beginners]({{ site.baseurl }}{% link _posts/2018-07-30-sidekiq_background_jobs_for_beginners.md %})

### An 8-part Guide to Preparing for Turing's Backend Program

_2017-2020_

Dozens of Turing students have said that this guide has been the reason they've been successful at Turing. That means, conservatively, this guide has delivered tens of thousands of dollars of value. A slightly more expansive definition of value (inclusive of opportunity cost and time) means this guide has delivered _hundreds of thousands of dollars of value_.

I'm proud of it. It's exactly what I wish I'd had before I attended Turing.

👉 [Chapter 1: Make Mod 1 Easier Than It Otherwise Would Be]({{ site.baseurl }}{% link _posts/2019-05-09-turing_prework_01_intro.md %})


# Miscellaneous Guides and Tutorials

I have written several (many?) guides/tutorials.

Most of them are _so focused_ that they're useful to almost no one, but for the person they _are_ useful to?

They have the potential to save that person hours-to-days of effort.

I am generally proud of the guides I write, though they often follow the impulse of [Write it now](https://josh.works/write-it-now).

I also have a billion (er, actually about 200) github gists floating around. I used to use them as a knowledge management system thanks to an [AlfredApp plugin](https://github.com/danielecook/gist-alfred). Here's my [several public github gists](https://gist.github.com/josh-works/public). 

I rarely edit things more than once. Without further ado, here's a very non-exhaustive list of some of these posts. I'm rather proud of several of them. 

- [Mike Clayville, You Can Have A Huge Impact on Cancer Treatment and Prevention (an open letter)]({{ site.baseurl }}{% link _pages/mike-clayville-huge-impact-on-cancer.md %})
- [How To Build a Personal Website in Jekyll - A Detailed Guide For First-Timers]({{ site.baseurl }}{% link _posts/2020-08-06-setting-up-basic-jekyll-site-for-turing-backend-students.md %})
- [Sidekiq and Background Jobs for Beginners]({{ site.baseurl }}{% link _posts/2018-07-30-sidekiq_background_jobs_for_beginners.md %})
- [How To Take Back Your Attention On The Internet with uBlock]({{ site.baseurl }}{% link _posts/2018-01-21-take_back_your_attention.md %})
- [How To Write A Letter of Recommendation for Yourself]({{ site.baseurl }}{% link _posts/2020-08-07-how-to-write-a-letter-of-recommendation-for-yourself.md %})
- [A Runbook for Upgrading Your Parent's Junky Old Laptop to a Chromebook]({{ site.baseurl }}{% link _posts/2020-08-03-parents-guide-to-painless-chromebook-setup.md %})
- [How to Integrate Stripe and a static site]({{ site.baseurl }}{% link _pages/stripe_course.md %})
- [Change your MAC address with a shell script]({{ site.baseurl }}{% link _posts/2019-12-18-bash_basics.md %})
- [Aggregate and deduplicate your deprecation warnings in Rails]({{ site.baseurl }}{% link _posts/2019-10-03-aggregate-and-deduplicate-deprecation-warnings.md %})
- [How I take notes, AKA 'Add an Index to Your Notebook']({{ site.baseurl }}{% link _posts/2019-09-04-build-an-index-into-your-notebook.md %})
- [How to Run Your Rails App in Profiling Mode]({{ site.baseurl }}{% link _posts/2019-07-29-how-run-your-rails-app-in-profiling-mode.md %})
- [Setting up Application Performance Monitoring in DataDog in your Rails App]({{ site.baseurl }}{% link _posts/2019-07-28-data_dog_setup.md %})
- [Load Testing your app with Siege]({{ site.baseurl }}{% link _posts/2019-07-17-load-testing-your-app-with-siege.md %})
- [Benchmarking a page protected by a login with Apache Benchmark]({{ site.baseurl }}{% link _posts/2019-06-28-apache_benchmark_load_testing_app_behind_login_page.md %})
- [Exploring source code via Griddler and Griddler-Mailgun]({{ site.baseurl }}{% link _posts/2019-06-08-exploring_griddler_and_griddler_mailgun_source_code.md %})
- [Troubleshooting Chinese Character Sets in MySQL]({{ site.baseurl }}{% link _posts/2019-04-21-chinese_charsets_in_mysql.md %})
- [How To Procfile: Run Just a Single Process]({{ site.baseurl }}{% link _posts/2019-02-21-procfile_basics.md %})
- [Use the `ls` Command to Show Directory Contents (when SSH'ed in to a server and don't have `tree`)]({{ site.baseurl }}{% link _posts/2018-10-03-unix_ls_command.md %})
- [Rails Migrations: When you can't add a uniqueness constraint because you already have duplicates]({{ site.baseurl }}{% link  _posts/2018-09-28-rails_migrations_add_unique_constraint_with_existing_duplicates.md %})
- [Pry Tips and Tricks]({{ site.baseurl }}{% link _posts/2018-05-07-pry_tips_tricks.md %})
- [MacOS: Keyboard Shortcut to Toggle Bookmarks Bar in Firefox]({{ site.baseurl }}{% link _posts/2018-02-15-toggle_bookmarks_bar_in_firefox.md %})
- [Testing Rake Tasks in Rails]({{ site.baseurl }}{% link _posts/2018-02-08-test_rake_tasks_rails.md %})