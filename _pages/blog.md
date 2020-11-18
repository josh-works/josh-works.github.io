---
layout: page-no-anchor
title: Blog
permalink: /blog
---
I've got >250 blog posts, so here's a bit of a best-of section.

[Click here to jump to the full list](#all-blog-posts-order-by-date_published-desc)

### Best-of: Programming-related

I learn by writing things down, and refer to my own writing regularly to refresh my memory on how to do something. 

Here's a smattering of the programming-related posts I've written.

_note: I also run [https://intermediateruby.com/](https://intermediateruby.com/), where I'm helping early-career software developers grow as quickly as possible into mid-career software developers. If you think you might benefit from this, click the link and check it out!_

- [Exploring source code via Griddler and Griddler-Mailgun]({{ site.baseurl }}{% link _posts/2019-06-08-exploring_griddler_and_griddler_mailgun_source_code.md %})
- [How to ask questions of experts and gain more than just an answer]({{ site.baseurl }}{% link _posts/2017-05-29-ask-better-questions.md %})
- [Pry Tips and Tricks]({{ site.baseurl }}{% link _posts/2018-05-07-pry_tips_tricks.md %})
- [Rails Migration: When you can’t add a uniqueness constraint because you already have duplicates]({{ site.baseurl }}{% link _posts/2018-09-28-rails_migrations_add_unique_constraint_with_existing_duplicates.md %})
- [Workflow for developers (AKA My current tools)]({{ site.baseurl }}{% link _posts/2017-05-27-developer-workflow.md %})
- [Playing with the HTTP send/response cycle in Ruby, without Faraday ("HTTP Yeah You Know Me" project)]({{ site.baseurl }}{% link _posts/2017-04-07-playing-with-the-http-sendresponse-cycle-in-ruby.md %})

### Best-of: Non-programming Miscelaneous 

"Programming" is a narrow domain. I vastly prefer to think of myself as a problem solver who sometimes uses code. Here's a collection of writings from the last ~10 years I've been writing. Most of it is from before I became a software developer.

- [62 Lessons Learned after one year of full time travel]({{ site.baseurl }}{% link _posts/2016-05-30-62-lessons-learned-after-year-of-full-time-travel.md %})
- [What I've learned from cooking in 36 kitchens in the last year]({{ site.baseurl }}{% link _posts/2016-05-09-what-ive-learned-from-cooking-in-36-kitchens-in-the-last-year.md %})
- [12 Lessons Learned While Publishing Something Every Day for a Month]({{ site.baseurl }}{% link _posts/2016-06-05-12-lessons-learned-while-publishing-someone-every-day-for-a-month.md %})
- [Hidden Damages of the Introvert vs. Extrovert "debate"]({{ site.baseurl }}{% link _posts/2014-07-22-hidden-damages-of-the-intovert-vs-extrovert-debate.md %})
- [Overcome (some) barriers in work with this magic phrase]({{ site.baseurl }}{% link _posts/2016-05-10-overcome-some-barriers-in-work-with-this-magic-phrase.md %})
- [About working remotely at Litmus with Pajamas.io]({{ site.baseurl }}{% link _posts/2016-03-16-my-interview-with-pajamasio.md %})
- [A Little Bit of Slope Makes For A Lot Of Y-Intercept]({{ site.baseurl }}{% link _posts/2015-06-26-2015-6-25-a-little-bit-of-slope-makes-up-for-a-lot-of-y-intercept.md %})
- [Be Gentle To You]({{ site.baseurl }}{% link _posts/2014-07-20-be-gentle-to-you.md %})
- [Build a Personal Website in Jekyll - A Detailed Guide For First-Timers]({{ site.baseurl }}{% link _posts/2020-08-06-setting-up-basic-jekyll-site-for-turing-backend-students.md %})
- [Talent is Overrated]({{ site.baseurl }}{% link _posts/2014-01-09-if-you-can-learn-anything-should-you.md %})

### Best-of: Annual Reviews

I've done annual reviews for the last few years. I enjoy reading _other_ people's annual reviews, so I'll make it easy for others to find mine, if this is their cup of 🍵.

- [2019 Annual Review]({{ site.baseurl }}{% link _posts/2020-01-31-2019-annual-review.md %})
- [2018 Annual Review]({{ site.baseurl }}{% link _posts/2019-05-05-2018_review.md %})
- [2017 Annual Review]({{ site.baseurl }}{% link _posts/2018-01-01-2017_review.md %})
- [2016 Annual Review]({{ site.baseurl }}{% link _posts/2017-01-11-2016-biggest-lesson-most-dangerous-books.md %})
- [2015 Annual Review]({{ site.baseurl }}{% link _posts/2016-01-23-2015-the-year-i-didnt-think-much.md %})

### Best-of: Books

I read. A lot. 

- [30 Books I Recommend Most Often]({{ site.baseurl }}{% link _posts/2018-05-17-recommended_reading.md %})
- [2018 Reading Review & Recommendations]({{ site.baseurl }}{% link _posts/2019-02-25-2018_books.md %})
- [Recommended books from 2017]({{ site.baseurl }}{% link _posts/2018-01-15-2017_books.md %})
- [2016 - Biggest Lesson, Most Dangerous Books]({{ site.baseurl }}{% link _posts/2017-01-11-2016-biggest-lesson-most-dangerous-books.md %})
- [Book Notes: 'The Case Against Sugar' by Gary Taube]({{ site.baseurl }}{% link _posts/2019-08-12-notes-gary-taubes-case-against-sugar.md %})

-------------------------

## All Blog Posts (`ORDER BY date_published DESC`)
{% for post in site.posts %}
  * [ {{ post.title }} ]({{ post.url }}) <time class="archive-date">{{ post.date | date: '%b %Y' }}</time>

{% endfor %}
