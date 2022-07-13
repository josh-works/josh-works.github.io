---
layout: post
title:  "Sidekiq in Practice"
description: "Running Notes on Nate's Sidekiq in Practice Course"
date:  2022-07-04 06:00:00 -0700
crosspost_to_medium: false
published: true
categories: [urbanism]
tags: [dirt, place-making, golden]
permalink: 'experiments'
image: /images/title_image.jpg
issue_id: 55
---

Working through [https://nateberk.gumroad.com/l/sidekiqinpractice](https://nateberk.gumroad.com/l/sidekiqinpractice).

Similar to what I did for [Noah Gibb's Rebuilding Rails Course](https://www.intermediateruby.com/rebuilding-rails-course-walkthrough)

_draft notes, scratch pad, etc_

Context: I joined a team at Homebot that deals with _lots_ of background jobs, via Sidekiq and Redis. _lots_ of jobs, every day. Many queueus. Time matters. Performance matters. So, here we go, deep dives, left and right.

I'm using this to store notes/code snippets for me, and others.

### [Tips on Sidekiq Queues (Phil.tech)](https://phil.tech/2016/tips-on-sidekiq-queues/)

I had to reference [https://josh.works/sidekiq-and-background-jobs-in-rails-for-beginners#making-sidekiq-do-stuff-via-the-rails-console](https://josh.works/sidekiq-and-background-jobs-in-rails-for-beginners#making-sidekiq-do-stuff-via-the-rails-console) a few times, when I borked job enquing, and they all blew up hard.

Working through the above resource, for starters:


```yaml
#  config/sidekiq-importance.yml
:concurrency: 5
:queues:
  - foo
  - bar
  - baz
  - nevergonnagiveyouup

```

```ruby
# app/jobs/priority_test_job.rb
class PriorityTest
  include Sidekiq::Worker

  def perform(*args)
    Rails.logger.info args
    Rails.logger.info "prioritytest: current time: #{Time.now}"
    Rails.logger.info 3 + 3 # difficult & computationally expensive operation
    sleep 3
  end
end
```
start redis, then sidekiq:


```
redis-server
bundle exec sidekiq -C ./config/sidekiq-importance.yml
```

in console:
```ruby
require 'sidekiq/api'
Sidekiq.strict_args!(false)
Sidekiq::Extensions.enable_delay!

queues = [:foo, :bar, :bazzzzz, :nevergonnagiveyouup]

50.times do |i|
  queues.each do |level|
    PriorityTest.perform_async(queue: level)
    p "#{i}: #{level}"
  end
end
```

If jobs are stuck, might need:


```ruby
require 'sidekiq/api'
Sidekiq::Queue.all.each(&:clear)
Sidekiq::RetrySet.new.clear
Sidekiq::ScheduledSet.new.clear
Sidekiq::DeadSet.new.clear
```

Tried as I did, I never got the same results Phil did.

### [Sidekiq In Practice](https://nateberk.gumroad.com/l/sidekiqinpractice)

more notes to come soon!

### Related Reading

- []()
