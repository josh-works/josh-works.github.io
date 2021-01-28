---
layout: page-no-anchor
title: Blog
permalink: /blog
---

### Miscellaneous Best-of

I've got >250 blog posts, so here's a bit of a best-of section.

- [How to ask questions of experts and gain more than just an answer]({{ site.baseurl }}{% link _posts/2017-05-29-ask-better-questions.md %})
- [Rails Migration: When you can’t add a uniqueness constraint because you already have duplicates]({{ site.baseurl }}{% link _posts/2018-09-28-rails_migrations_add_unique_constraint_with_existing_duplicates.md %})
- [Playing with the HTTP send/response cycle in Ruby, without Faraday ("HTTP Yeah You Know Me" project)]({{ site.baseurl }}{% link _posts/2017-04-07-playing-with-the-http-sendresponse-cycle-in-ruby.md %})
- [What I've learned from cooking in 36 kitchens in the last year]({{ site.baseurl }}{% link _posts/2016-05-09-what-ive-learned-from-cooking-in-36-kitchens-in-the-last-year.md %})
- [Hidden Damages of the Introvert vs. Extrovert "debate"]({{ site.baseurl }}{% link _posts/2014-07-22-hidden-damages-of-the-intovert-vs-extrovert-debate.md %})
- [Overcome (some) barriers in work with this magic phrase]({{ site.baseurl }}{% link _posts/2016-05-10-overcome-some-barriers-in-work-with-this-magic-phrase.md %})
- [A Little Bit of Slope Makes For A Lot Of Y-Intercept]({{ site.baseurl }}{% link _posts/2015-06-26-2015-6-25-a-little-bit-of-slope-makes-up-for-a-lot-of-y-intercept.md %})
- [Be Gentle To You]({{ site.baseurl }}{% link _posts/2014-07-20-be-gentle-to-you.md %})
- [Build a Personal Website in Jekyll - A Detailed Guide For First-Timers]({{ site.baseurl }}{% link _posts/2020-08-06-setting-up-basic-jekyll-site-for-turing-backend-students.md %})


-------------------------

## All Blog Posts 

{% for post in site.posts %}
  * [ {{ post.title }} ]({{ post.url }}) <time class="archive-date">{{ post.date | date: '%b %Y' }}</time>

{% endfor %}
