---
layout: post
title:  "How to Log Dead Sidekiq jobs to Sentry"
description: ""
date:  2022-07-13 06:00:00 -0700
crosspost_to_medium: false
published: false
categories: [programming]
tags: [rails, sidekiq, sentry]
permalink: 'how-to-log-dead-sidekiq-jobs-to-sentry'
image: /images/title_image.jpg
---

I wanted to log dead jobs to Sidekiq. Found [this issue](https://github.com/mperham/sidekiq/issues/3531), lead to:

```ruby
Sidekiq.configure_server do |config|
  config.death_handlers << ->(job, ex) do
    # do stuff
    # job keys: ["class", "args", "retry", "queue", "backtrace", "jid", "created_at", "enqueued_at", "error_message", "error_class", "failed_at", "retry_count", "error_backtrace"]
  end
end
```

So, tossed this into our `config/sidekiq.rb`

```ruby
config.death_handlers << ->(job, ex) do
  # job keys:
  # ["class", "args", "retry", "queue", "backtrace", "jid", "created_at",
  #  "enqueued_at", "error_message", "error_class", "failed_at",
  # "retry_count", "error_backtrace"]
  Sentry.capture_message("#{job["class"]} entered Dead queue with #{job["args"]}
    after #{job["retry_count"]} retries. #{job["error_message"]}. Exception: #{ex}")
end
```

So far, so good.
