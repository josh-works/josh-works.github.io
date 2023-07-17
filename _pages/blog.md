---
layout: page-no-anchor
title: Blog
permalink: /blog
---

# Start Here

I sometimes appreciate when other writers-on-the-internet give a 'start here' list. I've tried a few different ways to build this list, and so far have not found a format that I like, so I'll direct you to explore via one of three ways:

- [a list of all tags used on all blog posts]({{ site.baseurl }}/tags)
- visit [the about page]({{ site.baseurl }}{% link _pages/about.md %})
- visit [the projects page]({{ site.baseurl }}{% link _pages/projects.md %})

# All Blog Posts

{% for post in site.posts %}
  * [ {{ post.title }} ]({{ post.url }}) <time class="archive-date">{{ post.date | date: '%b %Y' }}</time>

{% endfor %}

