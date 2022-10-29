---
layout: post
title:  "How to Log Dead Sidekiq Jobs to Sentry"
description: "Notes about programming"
date:  2022-07-18 06:00:00 -0700
crosspost_to_medium: false
published: false
categories: [programming]
tags: [rails, sidekiq]
permalink: 'how-to-log-dead-sidekiq-jobs-to-sentry'
image: /images/title_image.jpg

---

At Homebot, we've got a bunch of sidekiq jobs that look like this:

```ruby

class Job
  include Sidekiq::Worker
  include Sidekiq::Throttled::Worker

  sidekiq_options queue: 'low',
                  retry: 5
                  
.
.
.
def notify_sentry(exception, extras)
    Sentry.capture_exception(exception)
  end
end
```

We're logging jobs to Sentry every time they fail, even with multiple re-tries. 

Sometimes a job fails the first time and passes the second, so I wanted to clean up these jobs, and log _only_ dead Sidekiq jobs to Sentry. 

I remembered seeing something about dead jobs and callbacks, Mike Perham left a comment on [a github issue](https://github.com/mperham/sidekiq/issues/3531) that said:

```ruby
Sidekiq.configure_server do |config|
  config.on(:dead) do |job_hash|
    # do something, e.g.
    # SlackNotifier.dead_job(job)
  end
end
```
Perfect. Lets make this work in our app and with Sentry. 

First, I wanted to see that I could manually trigger notifications for Sentry, and find them easily. I looked through our prod sentry exceptions for anything coming from the jobs I want to re-configure, and found (many) exceptions there. (Woot).

My local environment doesn't send out to Sentry, so logging into a test/dev environment, and booting into a Rails console there, running:

```ruby
begin
  1 / 0
rescue ZeroDivisionError => exception
puts exception
  Sentry.capture_exception(exception)
end
```

it returns `nil`, and there's nothing logged in Sentry, scoped to that environment. 🤔


### Misc notes

```ruby
CoolJob.perform_async(object)
CoolJob.perform_later(object)
CoolJob.perform_async(object.id)
Cooljob.perform_later(object.id)
```

Idempotency (in email)

```
$ rails g migration addWelcomeEmailSentToUsers welcome_email_sent:datetime # speculative
$ rails g mailer WelcomeNotification welcome_user # actual
$ rails g model regular_user name:string email:string welcome_email_sent_at:datetime
```

```ruby
# cool_job.rb

class CoolJob
    def perform(user_id)
        user = User.find user_id

        return if user.welcome_email_already_sent?

        WelcomeNotification.welcome_user(user).deliver_now # i
    end

    private

    def welcome_email_already_sent?
        # user.welcome_email_already_sent? # a bit decoupled
        user.welcome_email_sent.present?
    end
```


## Related Reading

- [Dead jobs callback/notification](https://github.com/mperham/sidekiq/issues/3531)
- [Sentry Error Tracking with Rails](https://sulmanweb.com/sentry-error-tracker-with-rails/)
- [background workers with activejob and sidekiq(gorails.com)](https://gorails.com/episodes/background-workers-with-activejob-and-sidekiq?autoplay=1)


## Footnotes