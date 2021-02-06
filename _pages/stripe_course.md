---
layout: page
title: How to Integrate Stripe Checkout and a Jekyll Static Site
status: published
type: page
published: true
description: "How to take payment via Stripe on a static site, by Josh Thompson"
permalink: /add-stripe-to-static-site-course
image: "/images/2019-09-20-stripe-01.jpg"
---

# How to Integrate Stripe Checkout and a Jekyll Static Site

Keep reading if:

👉 You use a static site generator like Jekyll, or Hugo, or Hexo, or Gasby

👉 You want to sell some small digital product, that could be delivered via email, without using a service that charges a monthly fee or hosts the sales landing page for you

👉 Part of the reason you use a static site generator is because you're leery of using a third-party tool like Gumroad or WooCommerce, and you want to roll-your-own

👉 You want it to "just work" - be able to take credit cards, Apple Pay, or Google Pay, to minimize any friction your potential customers might experience

👉 You're running a static site because you don't like "magic" or overly-complex tools

I, personally like Jekyll because it's fast and lightweight[^cold-head-hands]. Pingdom says this very page you're reading is [about 380Kb and loads in 470ms](https://tools.pingdom.com/#5b53cbf885c00000). That's pretty light and pretty quick. 

[^cold-head-hands]: And you can pry Ruby from my cold dead hands.

I didn't want to have to deal with a _database_ just to sell some some simple digital products.

👉 [**click here to jump to the 'give me a sample, let me see what I'm going to get' part**](#get-a-sample)

## You should buy the guide if: `you want to be able to take payments on your site for simple info products`

You don't want to re-invent the wheel and jump into a Gumroad-like situation, just to distribute some files after someone pays you some money. 

Maybe the idea of vendor lock-in sends you running for the hills. Horror stories of Paypal withholding funds makes you uncomfortable, but you don't like redirecting a customer to a whole second landing page to purchase something.

Or you happen to like Stripe, the company, and want to see what the deal is with using their tools. 😁

## You should buy the guide if: `you value your time`

When I started this little project, I thought it would take just a few hours. Stripe's documentation is _the gold standard_ for API docs, and Zapier and Gmail are super simple. How hard could it be to get everything up and running?

The answer is `longer than I expected`. I think it took me way too many hours to do what would now take me about... two hours. 

Let my many hours of extra effort save you a few hours of your own. 

**If if you make $80,000/year, your effective hourly rate is $40/hr.** You may prize your precious non-work hours even more than $40/hr.

This course will save you at least **five** of your non-work hours, so you can get to building/selling the things you want to build and sell, and living your life. 

If you value your free time no higher than your work time, five hours if worth about $200. Fortunately, this course will cost about one hour of salary. 

**If you value your time at at least $6/hr, this course will be money well spent.**

I didn't know any of the gotchas and issues that popped up as I made this course. I document them all carefully, for your benefit. You'll save many hours of time and whatever monthly fees Gumroad or another provider would charge you. 

## You should buy the guide if: `you use a static site generator, and are comfortable with Zapier's free tier`

If you have the means to get HTML and JavaScript on the internet, and want to be able to take payment for some digital product, you'll get a ton of value from this course.

I personally use Jekyll, so code snippets and screenshots in this course are Jekyll-inclined. But this general process translates nicely to any other kind of static site generator, or just hand-rolled HTML. 

On top of that, we'll be using Stripe, Zapier, Dropbox, and Gmail to wire this all together. I don't use the paid versions of any of these tools, but even if you want to use a different tool or a paid version of one of these tools, you'll still learn helpful principles and entry/exit points to those tools. 

This isn't a course for _only_ full-time software developers (or those of us full-time software developers who don't know much HTML and JavaScript! 😉). I assume you're comfortable in a code editor, but we don't go deep _at all_ with HTML or JS or CSS. Just enough to accomplish our basic goals. 

I don't use any code but pretty much what Stripe auto-generates for me; almost everything else is plugging together the tools on their respective websites. 

I mix annotated screenshots, gifs, code snippets, and more to make a clear walk-through of _exactly_ what I'm doing. It'll be effortless for you to follow. 

Here's a gif of what the course looks like, as I scroll down the document.

![course preview](/images/course_preview.gif)

## You should not buy the guide if: `you're a student, or not a software developer, or live outside the USA`

If you want this guide, I want you to have it. On the flip side, I started trying to sort all this out myself because I was willing to spend a few hours digging around. I ended up sinking more than 30 hours into figuring this all out.[^embarrassing]

[^embarrassing]: Yes, that's embarrassing. I hold in my mind this idea that "Good" developers do thigns quickly, easily, the first time. I'm slowly disabusing myself of that notion, but it's slow going. I'm not ashamed that this took me 30+ hours to figure out. I'm not ashamed that this took me 30+ hours to figure out. _I'm not ashamed that this took me 30+ hours to figure out._

A number of students and persons who live outside the USA have contacted me (at `thompsonjoshd@gmail.com`) and asked for this for free, _and I gladly provisioned them with a copy_. I don't want _everyone's_ money, I want _the money from people who are cash-rich and time-poor_. If you're a softare developer, working in the USA, on a side project, and you're reading this? Just pay the money, it'll save you 30+ hours and make it substantially more likely your customers will have a good experience.

_[If you would like to download a free sample, keep scrolling or click this link](#can-i-have-a-sample)_

## 10 things you'll learn in this course

5. You'll learn what event types Stripe tracks that Zapier can pick up. (None of the defaults work!) **This was the single hardest piece of this process for me to figure out.** After talking with the support teams of both Zapier and Stripe, I sorted it out and I'm excited to share this with you!
6. How to quickly configure Dropbox folders to distribute _exactly_ what you want to distribute, like free samples, product tiers, etc.
4. You'll learn how to navigate the test modes across products, customers, purchases, and connections to third-party tools. 
1. The default HTML/Javascript from Stripe has a formatting error. The button won't work until you fix it. I'll show you the error.
2. The default button formatting (from Stripe) makes it hard to tell that it's a button. I'll show you how to fix this with a little HTML and CSS. 
3. You don't want to violate Stripe's Terms of Service while testing. I'll show you how to safely test Stripe purchases. 
7. I use Gmail (with Zapier) to send the course out; I'll show you how configure and test this part of the process.
8. How to DRY out your JavaScript in Jekyll; if you run with JUST the default JavaScript as provided by Stripe, your landing page's HTML might get a bit cluttered.
9. Pitfalls around navigating between Test and Non-test modes in Stripe. 
10. How to use completely free tools to distribute digital content. You're welcome to pay for paid plans on any of these, but if you're looking for _just_ something quick, easy, and free - this will work!


## What your course includes:

- 32 minutes of edited screencasts, mixed in with 
- 26 annotated screenshots, which pair well with the
- 11 gifs contained within
- 1 html document
- across about 30 pages

I told you - this isn't easy. _It was surprisingly difficult_. It takes time for me to convey all the gotchas and complexity, but I'm good at explaining it. 

The value of saving 20-40 hours of frustration? _priceless_, or _what your employer pays you $2000 for_, or _if you value your non-work time more highly than your work time, this could be worth $5,000+ to you._

_If I **were** to print this guide, it be about 30 pages long. Much of the space, however, is annotated screenshots and gifs! You'll be able to work through it in just one or two sittings._

### 100% Satisfaction Guarantee

At any point in time, between now and forever, you can get a 100%, no-questions-asked, refund.

I have complete confidence in the value of what you're getting; if you decide it's not a good fit, or life circumstances change and you need the cash on hand - no problem.

Send me an email, and you get a refund, no questions asked. Oh, and you get to keep the course.


## Testamonials

> Wow Josh, thank you so much! With your guide, I went from being quite stuck to getting it pretty much all working!

- [Ron Erdos](https://twitter.com/RonErdos), who used this course to publish [SEO tips for Hugo developers (Moonbooth)](https://moonbooth.com/hugo/seo-theme/)


## How Will You Read It?

Soon after you purchase the course, you'll receive an email from me. 

In that email will be a link to a Dropbox folder. In that Dropbox folder will be your course!

When you download the ZIP, you'll see that it contains a HTML document. 

Right click the document, Select `Open With (Firefox, Chrome, Safari)`, and voilà, you'll have text, screenshots, gifs, and in-line video, all in an easy-to-read document. 

There's no DRM or crazy shenannigans. I want you to have full access, forever, to what you've purchased.

----------------------------------------

## Get a sample

This course costs 💰💰💰, and money changes hands after trust is built, so I invite you to test-drive this process! Using the "Get free sample" button below, you can experience the full "customer experience", for free, in order to obtain a sample of this course.

If you like what you see, you can purchase the course and learn how to build this out.

<div class="stripe_payment_card_row">
  <div class="payment_card">

<h2>Get your preview of The Complete Package</h2>

<ul>
  <li>To get the sample, click the button below and enter `4242 4242 4242 4242` for the credit card number, and an expiration date with any date in the future. </li>
  <li>Please enter a real email address, as that's how you'll receive the course sample.</li>
</ul>
<div class="stripe_button_container">
<button
  id="checkout-button-sku_Fo5gnUdda4RhOF"
  class="stripe_button"
  role="link">
  Get free sample
</button>
<div id="error-message"></div>
</div>
</div>
</div>


## Take My Money (for real this time)

All payment options support credit card, Apple Pay, and Google Pay:

<div class="stripe_payment_card_row">

<div class="payment_card">
<h2>Just The Book</h2>
<h1>$29</h1>
<ul>
  <li>HTML document with embedded pictures and gifs</li>
  <li>Updates for life</li>
</ul>
<div class="stripe_button_container">
  <div class="button_container">
    <button
      class="stripe_button"
      id="checkout-button-sku_FluboPRKa9hMRB"
      role="link">
      Buy Now ($29)
    </button>
    <div id="error-message"></div>
  </div>
  </div>
</div>


  <div class="payment_card">
  <h2>The Complete Package</h2>
  <h1>$49</h1>
  <ul>
    <li>HTML document with embedded pictures and gifs</li>
    <li>Updates for life</li>
    <li>30 minutes of video walkthrough across 6 different topics</li>
  </ul>
  <div class="stripe_button_container">
    <div class="button_container">
      <button
        class="stripe_button"
        id="checkout-button-sku_Fo316cEMlpUL79"
        role="link">
        Buy Now ($49)
      </button>

      <div id="error-message"></div>
    </div>
    </div>
  </div>
</div>
----------------------

# About The Author

I'm a software developer who's learning new things, every day. I'm also a rock climber, compulsive teacher (I've been doing it officially and unofficially for over a decade) and I've earned substantial trust via the teaching that I do.[^trust]

👉 [me on Twitter](https://twitter.com/josh_works)

[^trust]: Teaching is based on trust. No trust, no good knowledge transfer. I've taught people how to stay safe and thrive in situations that could easily lead to death (rock climbing!) and I'm pretty good at situations _not_ involving life and death, like Stripe Checkout. If you're on the fence on "is Josh trustworthy", the answer is an emphatic "usually, in many situations."

I've been mentoring Turing students for the last few years, and have been known to give talks at local tech meetups.[^samples] 

[^samples]: For examples, [here's a talk I gave for developers]({{ site.baseurl }}{% link _posts/2018-02-10-boulder_ruby_group.md %}), [a podcast episode about psychological and physical safety in climbing/software development](https://www.greaterthancode.com/safety-science-and-failure-as-an-opportunity), and [this guide]({{ site.baseurl }}{% link _posts/2019-05-09-turing_prework_01_intro.md %}) has shepharded dozens of people through tumultuous times. All for free.

I've found that one of the best ways to further knowledge of a topic is to _teach_ it, which is why teaching is so core to how I learn. 

---------------------- 

### Frequently asked questions:


## Can I have a sample?

I invite you to test-drive this process! Using the "Get free sample" button below, you can experience the full "customer experience", for free, in order to obtain a sample of this course.

If you like what you see, you can purchase the course and learn how to build this out.

<div class="stripe_payment_card_row">
  <div class="payment_card">

<h2>Get your preview of The Complete Package</h2>

<ul>
  <li>To get the sample, click the button below and enter `4242 4242 4242 4242` for the credit card number, and an expiration date with any date in the future. </li>
  <li>Please enter a real email address, as that's how you'll receive the course sample.</li>
</ul>
<div class="stripe_button_container">
<button
  id="checkout-button-sku_Fo5gnUdda4RhOF"
  class="stripe_button"
  role="link">
  Get free sample
</button>
<div id="error-message"></div>
</div>
</div>
</div>

### Is there DRM? 

There's no DRM or crazy shenannigans. I want you to have full access, forever, to what you've purchased.

### Will I be able to get questions answered, if they pop up?

Of course. Send me an email, and I'll help out!

### Will this course continue to be updated? Will I get free access to future versions?

Absolutely! As I add things to the course, and as I get specific questions from customers, I'll roll those updates into the course, and I'll email you with the changelog when I do. 😄

### Do I need to be a software developer to use understand this course?

Not at all. The vast majority of the code we work with is copy-pasted from Stripe, to generate a simple button. Most of the complexity I faced was just figuring out how to connect all of the services together, and that's where 95% of my time went. 

Of course, if you decide that the course _is_ over your head, or it's not what you were expecting - I do 100% no-questions-asked money back.

### I cannot afford this! I'm trying to set all of this up as inexpensively as possible. Why are you charging me money?

If you're truly unable to afford this course, send me an email, and I'll send it to you for free. I'm not kidding. I expect this group would include students, individuals who live in less-affluent parts of the world, etc. I'm happy to give this to you for free. I want to see people be able to make money by teaching and selling useful products.

Most of you, though, can afford the course. If you're earning $80,000/yr in salary, you're being paid about $40/hr. The premium version of this course therefore costs just over one hour of your salary, and it will save you at least ten hours of work, in addition to the monthly fees that you'd pay, using an all-in-one service. 

If you value your time above $5/hr, this course is a _fantastic_ deal. If, for whatever reason, you do _not_ value your time above $5/hr but you still want this course, send me an email. I'll hook you up. 

### What stack will be covered? What if I don't use Jekyll as my static site generator?

I use Jekyll, but I'm using plain HTML and CSS to create and style the purchase button, and Stripe provides a snippet of JavaScript, to make the button work. This "stack" will work on any tool you might use, even if your HTML is artisanal and hand-typed. 

### Why are you selling this course at all? Why not just write a guide and give it away?

Great question. I go [into more detail here]({{ site.baseurl }}{% link _posts/2019-12-22-why-i-sell-info-products.md %}), but here's some high points:

- I wanted to learn how to collect payment for something. Here's evidence I was successful. 
- Putting a price on something means I'll put a *lot* of effort into making it good
- When someone does something for free, they are telegraphing to the recipient that it's not worth any money



{% include stripe_button_js.html %}
