---
layout: post
title:  "Sidekiq and Background Jobs for Beginners"
date:  2018-07-30 06:00:00 -0700
crosspost_to_medium: true
categories: [programming]
tags: [ruby, rails, sidekiq, background_jobs]
permalink: sidekiq-and-background-jobs-in-rails-for-beginners
---

I've recently had to learn more about background jobs (using [Sidekiq](https://github.com/mperham/sidekiq), specifically) for some bugs I was working on.

I learned a lot. Much of it was *extremely* basic. Anyone who knows much at all about Sidekiq will say "oh, duh, of course that's true", but at the time, it wasn't obvious to me.

The reason I needed such basic overviews is because prior to my current job, I'd had just a few _hours_ of exposure to background jobs, and understood little of those hours. And I got dropped into a project that has dozens of jobs, handling hundreds of thousands of actions a day. 

As is my style, when I don't understand something, I like to go to the very basics.

Most of the interesting stuff is way down at the bottom, on [watching Redis do it's thing](#watching-redis)

<!--more-->

In this case, I went back to Turing! I found the [background jobs lesson](https://backend.turing.io/module3/lessons/background_workers) from Mod 3, and worked through it. 

I very much enjoy seeing evidence of things working "under the hood", rather than just accepting that `BackgroundWorker.perform_later(foo.id)` works differently than `BackgroundWorker.new.perform(foo.id)`, etc. So, this post will focus not as much on _using_ Sidekiq, but _seeing that it's working_. 

If you want to follow along, do the above tutorial. [This is what my repo looks like right now](https://github.com/josh-works/turing_sidekiq_tutorial/tree/eb5ef7eb34f8baefab9d763c469d9917c09c7d3f). I'll recap most of what's in the tutorial.

--------------------

To run the app, run each of the following, using multiple terminal tabs as needed:

```
rails s
redis-server
sidekiq
mailcatcher
```

The app should now working. Navigate to `[http://localhost:3000/](http://localhost:3000/)`, and you should see Missy Elliot in all her glory.

Open up [http://localhost:3000/sidekiq/](http://localhost:3000/sidekiq/) to see the sidekiq dashboard, and then over to [http://localhost:1080/](http://localhost:1080/) for mailcatcher. 

You'll notice that when sending emails via the app, nothing is happening on [http://localhost:3000/sidekiq/](http://localhost:3000/sidekiq/), and the redis terminal window is untouched:

![redis](/images/2018-07-25_redis.jpg)


## Convert a non-background-job to a background job

The essence of a background job is to do stuff _in the background_, without making the Rails app sit around doing all the work. 

To simulate the pain of waiting for synchronous jobs, when you use this app, the "send email" method has a five-second `sleep` in it. 

Lets make this a background job:

1. create the job. (you can use `rails generate job <job_name>`, per the [ActiveJob docs](https://edgeguides.rubyonrails.org/active_job_basics.html#create-the-job))
2. Call the `notify user job` from the controller, instead of calling the `user notifier` directly.

## Make the job

We'll hand-roll this. Make `app/jobs/send_user_gif_job.rb`.

```ruby
class SendUserGifJob < ActiveJob::Base
  queue_as :default
  
  def perform(*args)
    # do da ting
  end
  
end
```

(Deviated slightly from the docs with `ActiveJob::Base`. I'm working with Rails 4.2)

## Make a test

Working through the [rubyonrails.org docs on testing jobs](https://edgeguides.rubyonrails.org/testing.html#testing-jobs), I'll set up the following:

```ruby
# test/jobs/send_user_gif_job_test.rb

require 'test_helper'

class SendUserGifJobTest < ActiveJob::TestCase 
  test 'that email is sent' do
    SendUserGifJob.perform_async("test@test.com", "hello")
    # literally no idea what to assert here...
    # assert 
  end
  
end
```

I've no idea what to assert just yet, but we'll get there. Lets run the test!

...

Unfortunately, this test passes. :(

After taking a look at the [testing Sidekiq](https://github.com/mperham/sidekiq/wiki/Testing) docs, I've got some ideas. 

## Messed up Sidekiq?

After a bit of playing in the `rails console`, I had a bunch of bad jobs that Sidekiq was trying to process. Every time I started Sidekiq, it broke with a stack trace for "uninitialized constant", for a job/class/worker that didn't exist. 

To clear out everything in Sidekiq, run the following from the rails console:

```
Sidekiq::Queue.all.each(&:clear)
Sidekiq::RetrySet.new.clear
Sidekiq::ScheduledSet.new.clear
Sidekiq::DeadSet.new.clear
```

As usual, I found the answer [on Stack Overflow](https://stackoverflow.com/a/47290191/3210178) (I could see this being a very dangerous command to run in any sort of production environment. Don't do that, please.)

After clearing out the queue, I can run Sidekiq just fine. 

## Rework the test and worker

These are _workers_ and not _jobs_. `ActiveJob` _jobs_ live in `/jobs`. So, if you want a _worker_, don't put it in the `/jobs` directory, put it in the `/workers` directory. 

Don't ask me why I know this. 

I had problems because of where I stuck these files, and <s>had some other problems because of naming conventions</s> decided naming conventions are important. 

So, I threw away all the work and did `rails g sidekiq:worker SendGifToUserWorker`. 

Here's what I've got right now, after the `rails g` and taking some examples from the testing docs:

My `SendGifToUserWorker`

```ruby
# app/workers/send_gif_to_user_worker.rb

class SendGifToUserWorker
  include Sidekiq::Worker

  def perform(*args)
    # Do something
  end
end
```

My `SendGifToUserWorkerTest`

```ruby
# test/workers/send_gif_to_user_worker_test.rb

require 'test_helper'

class SendGifToUserWorkerTest < ActiveJob::TestCase
  test 'that email is sent' do
    SendGifToUserWorker.perform_async("test@test.com", "hello")
    # literally no idea what to assert here...
    # assert 
  end
  
  test 'that job is pushed to queue' do
    assert_equal 0, SendGifToUserWorker.jobs.size
    SendGifToUserWorker.perform_async("test@test.com", "hello")
    assert_equal 1, SendGifToUserWorker.jobs.size
  end
end

```

Unfortunately, the tests pass. This tells me the job is running fine (I guess), but no clue what is happening under the hood. 

_correction: the second test passes every-other-time or so._ The `jobs.size` queue isn't always starting at 0, so it fails the first assertion of 0.

A fix was to add the following setup method:

```ruby
# test/workers/send_gif_to_user_worker_test.rb:5

def setup
  Sidekiq::Worker.clear_all
end
```

## Making Sidekiq do stuff via the Rails Console

Since the tests don't push _actual_ jobs to Sidekiq, I don't see any indication that anything interesting is happening in Sidekiq web, or Redis, or the Sidekiq terminal window. :(
  
I updated the mail model in the application to actually use Sidekiq (no failing test quite right now, sorry) and here's my worker:

```ruby
# app/workers/send_gif_to_user_worker.rb
class SendGifToUserWorker
  include Sidekiq::Worker

  def perform(email, thought)
    UserNotifier.send_randomness_email(email, thought).deliver_now
  end
end
```

And it's getting called from the mailers controller, like so:

```ruby
# app/controllers/mailers_controller.rb
class MailersController < ApplicationController
  
  def create
    SendGifToUserWorker.perform_async(params[:mailers][:email], params[:mailers][:thought])
    flash[:message] = "You did it! Email sent to #{params[:mailers][:email]}"
    redirect_to "/sent"
  end

  def sent
  end
end
```

With that setup, in my `rails console`, I can do something like `SendGifToUserWorker.perform_async("test@test.com", "hello")`, and I get back some sort of GUID:

```
main:0> SendGifToUserWorker.perform_async("test@test.com", "hello")
=> "08e6a309cf7c46dc0178c53f"
main:0> SendGifToUserWorker.perform_async("test@test.com", "hello")
=> "8b962d28217ae177564f0fd7"
```

Each of these talks to Sidekiq, and you can see these jobs go by in the logs:

```
2018-07-27T17:13:55.023Z 10221 TID-ovusw76r0 SendGifToUserWorker JID-08e6a309cf7c46dc0178c53f INFO: start
2018-07-27T17:13:55.023Z 10221 TID-ovusw76r0 SendGifToUserWorker JID-08e6a309cf7c46dc0178c53f INFO: done: 0.0 sec
2018-07-27T17:13:57.521Z 10221 TID-ovusw781o SendGifToUserWorker JID-8b962d28217ae177564f0fd7 INFO: start
2018-07-27T17:13:57.521Z 10221 TID-ovusw781o SendGifToUserWorker JID-8b962d28217ae177564f0fd7 INFO: done: 0.0 sec
``` 

This is what it looks like, in the logs and sidekiq web, running the jobs from the Rails console:

![rails console, sidekiq web, and sidekiq](/images/2018-07-27_sidekiq_rails_console.gif)

So, cool. My job still isn't doing anything, but at least it's running. I guess.

## Restart Sidekiq when you make a change to a worker

It makes sense that the Sidekiq worker test might assert JUST that jobs get queued correctly. 

I'm still not content - my tests are passing, _without the sidekiq worker actually doing anything_. I'd feel great about a red test related to it. 

Everything to this point [is on commit `38f5750`](https://github.com/josh-works/turing_sidekiq_tutorial/tree/38f5750293edf3198e11b114851c8d313608f334), if you're following along. 

Sidekiq is queuing the job as I'd expect it to, even though it's not doing anything.

.

.

.

I just spent an embarrassing amount of time "troubleshooting" why my worker wasn't doing what I thought it should do. Turns out _you need to restart Sidekiq if you change a Sidekiq job_. Maybe this isn't always true, but if you're saying 

> why isn't <new thing> showing up in Sidekiq?

just restart Sidekiq. 

## Watching Redis

I want to make sure that this stuff is getting in and out of Redis as expected. Redis is a super fast key:value store, and we should see stuff getting written to, and read from Redis. 

Use `redis-server` to start Redis running. It's pretty boring to watch, and doesn't show you any information about data placed in/out of it, so not that helpful.

![boring redis](/images/2018-07-28_redis_01.jpg)

Once you have `redis-server` running, you can run (in another terminal tab) `redis-cli monitor`, which dumps you into something that prints a TON of logs when it's not doing anything. (all of the `hmset macbookpro` stuff is still _me doing nothing_. It's reading "server status" details like a hyperactive chipmunk on crack.)

![slow your roll, Redis](/images/2018-07-28_redis_02.gif)

I found the signal-to-noise ratio of `redis-cli monitor` to make it near-useless. What we care about in Redis are `hset`, and `lpush`. Maybe more, but this is sufficient for finding what I want.

So, once you've got redis running, to watch the logs for JUST `hset`s and `lpush`es, run: 

`redis-cli monitor | grep -E "(hset|lpush)"`

And you'll see nothing, until Sidekiq pushes jobs to Redis, and reads from it:

![thank you, redis](/images/2018-07-28_redis_03.gif)

- [redis docs for `hset`](https://redis.io/commands/hset)
- [redis docs for `lpush`](https://redis.io/commands/lpush)

Here's those lines, formatted for easier reading:

### lpush

```ruby
1532784329.095661 [0 127.0.0.1:53832] lpush queue:default 
  {
    class:SendGifToUserWorker,
    args:[flip,flop],
    retry:true,
    queue:default,
    jid:adfa15f29ed6c09cda7f6973,
    created_at:1532784329.095427,
    enqueued_at:1532784329.095466
  }
```

### hset

```ruby
1532784332.778327 [0 127.0.0.1:53803] hset MacBook-Pro-6715.local:32134:cc8d1568c5c6:workers ow3kb5tjc 
  {
    queue:default,
    payload:
      {
        class:SendGifToUserWorker,
        args:[flip,flop],
        retry:true,
        queue:default,
        jid:adfa15f29ed6c09cda7f6973,
        created_at:1532784329.095427,
        enqueued_at:1532784329.095466
      },
    run_at:1532784329
  }
```

By the way, Redis is a bit cleaner if you run the server as a background process. To do this, do:

`redis-server &` (the `&` makes it a background process). 

To stop Redis, just do `redis-cli shutdown`


## What does/does not occur

So, how can we be sure that our Sidekiq job is actually firing? Lets see what it looks like, using this worker _with_ Sidekiq, and without. 

Compare these two lines:

```ruby
SendGifToUserWorker.new.perform(params[:mailers][:email], params[:mailers][:thought])
SendGifToUserWorker.perform_async(params[:mailers][:email], params[:mailers][:thought])
```
Which one is using Sidekiq? 

The first line is creating a new instance of the worker class, and calling `perform` directly on it. _It's not hitting Sidekiq_, and if the job fails, it won't requeue. 

At least, I think this is the case. 

Here's what `rails server` (left), redis (filtering for `hset` and `lpush` events, top right) and Sidekiq (bottom right) look like when I trigger the email worker:

![using sidekiq](/images/2018-07-30_sidekiq_02.gif "using sidekiq")

Here's how I can see a job using `Worker.new.perform` doesn't "hit" sidekiq:

![not using sidekiq](/images/2018-07-30_sidekiq_01.gif "not using sidekiq")

The Rails server just sits for a while, and redis and Sidekiq seem clueless of the event? 

## Conclusion

One of the bugs I was working with, the root of the problem was the worker/job seemed to not be requeuing when it failed. I spent time touching up the worker, and logging around the specific error (it was a timeout on an internal API endpoint), but even after rescuing the timeout, the job wasn't happening again. 

Someone else on the team wisely pointed out that the entire worker was getting called with `Worker.new.perform()`, which was sidestepping (oh, the puns) the Sidekiq infrastructure. I understood this to be true, but I still wanted to see it for myself. 

In the process of working through this lesson, I found a [Stack Overflow post](https://stackoverflow.com/questions/19251976/get-sidekiq-to-execute-a-job-immediately) about "how to make Sidekiq execute a job immediately". The only answer suggested calling `Worker.new.perform`, and that must be, for some reason, why this bit of code ended up in our codebase. The developer wanted it to happen immediately, and perhaps did not expect it to fail at any point. 

Anyway, I'm content that I understand the basic difference between `Worker.perform_async` and `Worker.new.perform`, and next time I encounter an issue like this, I'll much more quicly wrap my head around it.



## Resources 

 - [Turing Sidekiq lesson](https://backend.turing.io/module3/lessons/background_workers)
 - [Testing async emails, the Rails 4.2+ way](https://www.engineyard.com/blog/testing-async-emails-rails-42)
- [Quickly booting `rails s` into production](https://stackoverflow.com/questions/30119144/rails-how-to-switch-between-dev-and-production-mode)
- [No route matches [GET] /assets](https://stackoverflow.com/questions/7829480/no-route-matches-get-assets)
- [StackOverflow: How to see set/get/ in redis log](https://stackoverflow.com/questions/14713084/how-to-see-set-get-in-redis-log)