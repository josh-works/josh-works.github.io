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

### [Tips on Sidekiq Queues (Phil.tech)](https://phil.tech/2016/tips-on-sidekiq-queues/)

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

  def self.log(level, sleep_for = 3)
    msg = "priority-test: #{level} thing happened"
    Rails.logger.info(msg)
    puts msg
    sleep sleep_for
  end
end
```
start redis, then sidekiq:


```
redis-server
bundle exec sidekiq -C ./config/sidekiq-importance.yml
```

in console:
```
require 'sidekiq/api'
Sidekiq.strict_args!(false)
Sidekiq::Extensions.enable_delay!

queues = [:foo, :bar, :baz, :nevergonnagiveyouup]

50.times do |i|
  queues.each do |level|
    PriorityTest.perform_async('queue'=> level)
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
