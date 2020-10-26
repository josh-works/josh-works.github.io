---
layout: page
title: Boulder Ruby Group meetup notes
status: publish
type: page
published: true
meta: {}
categories: [talks]
tags: [rails_performance, rails, programming]
permalink: boulder_ruby_group
image: "images_2020/2020-08-21 at 9.08 AM.jpg"
---

## Move Slow and Improve Things: Performance Improvement in a Rails App

_[Boulder Ruby Group Monthly Meetup @Recurly Offices](https://www.meetup.com/boulder_ruby_group/events/fsvznqyzdbrb/), Feb 13, 2018_

<iframe width="560" height="315" src="https://www.youtube.com/embed/992Uyrheo24" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

[Slides are available here on Dropbox](https://www.dropbox.com/s/pwsj4bqmzdqb9s7/boulder_rb_profiling.key?dl=0)

## Git Push, Git Paid

Here's the "Git Push, Git Paid" t-shirt I mentioned:

![git push git paid](/images/git_push_git_paid.jpg)

[Thoughtbot designed these](https://thoughtbot.com/blog/git-push-git-paid), and it looks like they're still [available for purchase on CottonBureau](https://cottonbureau.com/products/git-push-git-paid#/1134672/tee-men-standard-tee-vintage-black-tri-blend-s) for $28. 


## Slow Query lookup:

check to see what your current values are for [`long_query_time`](https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_long_query_time)

```sql
SELECT
  start_time
  ,user_host
  ,query_time
  ,sql_text
  ,lock_time
  ,rows_sent
  ,rows_examined
  ,db
  ,last_insert_id
  ,insert_id
  ,server_id
  ,thread_id
FROM
  mysql.slow_log
WHERE
  start_time >= DATE_ADD(current_timestamp, INTERVAL -1 DAY)
  ORDER BY
    query_time DESC
LIMIT 10000;
```

### What is Benchmarking and Profiling

> Profiling and benchmarking are flip sides of the same coin, profiling helps you to narrow down to where optimization would be most useful, benchmarking allows you to easily isolate optimizations and cross-compare them.

- [Dave Rolsky](https://blog.urth.org/2010/03/03/benchmarking-versus-profiling/)


### Additional reading

- [rack-mini-profiler docs](https://github.com/MiniProfiler/rack-mini-profiler)
- [3 ActiveRecord Mistakes That Slow Down Rails Apps: Count, Where and Present (Nate Berkopec)](https://www.speedshop.co/2019/01/10/three-activerecord-mistakes.html)
- [Nate Berkopec's _The Complete Guide to Rails Performance_](https://www.railsspeed.com/)
- [The Website Obesity Crisis (Maciej Cegłowski)](https://idlewords.com/talks/website_obesity.htm)

I'll be working on this Rails performance piece for a while, so if you'd like to see what else I'm learning, pop your email in below. 

Full disclosure: sometimes I write about things other than Ruby on Rails.

{% include newsletter.html %}

