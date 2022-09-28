---
layout: page-no-anchor
title: Blog
permalink: /blog
---


### Miscellaneous Guides and Tutorials

I write many, many guides/tutorials.

Most of them are _so focused_ that they're useful to almost no one, but for the person they _are_ useful to?

They have the potential to save that person hours-to-days of effort.

I am generally proud of the guides I write, though they often follow the impulse of [Write it now](https://josh.works/write-it-now).

I rarely edit things more than once.

- [How To Build a Personal Website in Jekyll - A Detailed Guide For First-Timers]({{ site.baseurl }}{% link _posts/2020-08-06-setting-up-basic-jekyll-site-for-turing-backend-students.md %})
- [Sidekiq and Background Jobs for Beginners]({{ site.baseurl }}{% link _posts/2018-07-30-sidekiq_background_jobs_for_beginners.md %})
- [How To Take Back Your Attention On The Internet with uBlock]({{ site.baseurl }}{% link _posts/2018-01-21-take_back_your_attention.md %})
- [How To Write A Letter of Recommendation for Yourself]({{ site.baseurl }}{% link _posts/2020-08-07-how-to-write-a-letter-of-recommendation-for-yourself.md %})
- [A Runbook for Upgrading Your Parent's Junky Old Laptop to a Chromebook]({{ site.baseurl }}{% link _posts/2020-08-03-parents-guide-to-painless-chromebook-setup.md %})
- [How to Integrate Stripe and a static site]({{ site.baseurl }}{% link _pages/stripe_course.md %})
- [Change your MAC address with a shell script]({{ site.baseurl }}{% link _posts/2019-12-18-bash_basics.md %})
- [Aggregate and deduplicate your deprecation warnings in Rails]({{ site.baseurl }}{% link _posts/2019-10-03-aggregate-and-deduplicate-deprecation-warnings.md %})
- [How I take notes, AKA 'Add an Index to Your Notebook']({{ site.baseurl }}{% link _posts/2019-09-04-build-an-index-into-your-notebook.md %})
- [How to Run Your Rails App in Profiling Mode]({{ site.baseurl }}{% link _posts/2019-07-29-how-run-your-rails-app-in-profiling-mode.md %})
- [Setting up Application Performance Monitoring in DataDog in your Rails App]({{ site.baseurl }}{% link _posts/2019-07-28-data_dog_setup.md %})
- [Load Testing your app with Siege]({{ site.baseurl }}{% link _posts/2019-07-17-load-testing-your-app-with-siege.md %})
- [Benchmarking a page protected by a login with Apache Benchmark]({{ site.baseurl }}{% link _posts/2019-06-28-apache_benchmark_load_testing_app_behind_login_page.md %})
- [Exploring source code via Griddler and Griddler-Mailgun]({{ site.baseurl }}{% link _posts/2019-06-08-exploring_griddler_and_griddler_mailgun_source_code.md %})
- [Troubleshooting Chinese Character Sets in MySQL]({{ site.baseurl }}{% link _posts/2019-04-21-chinese_charsets_in_mysql.md %})
- [How To Procfile: Run Just a Single Process]({{ site.baseurl }}{% link _posts/2019-02-21-procfile_basics.md %})
- [Use the `ls` Command to Show Directory Contents (when SSH'ed in to a server and don't have `tree`)]({{ site.baseurl }}{% link _posts/2018-10-03-unix_ls_command.md %})
- [Rails Migrations: When you can't add a uniqueness constraint because you already have duplicates]({{ site.baseurl }}{% link  _posts/2018-09-28-rails_migrations_add_unique_constraint_with_existing_duplicates.md %})
- [Pry Tips and Tricks]({{ site.baseurl }}{% link _posts/2018-05-07-pry_tips_tricks.md %})
- [MacOS: Keyboard Shortcut to Toggle Bookmarks Bar in Firefox]({{ site.baseurl }}{% link _posts/2018-02-15-toggle_bookmarks_bar_in_firefox.md %})
- [Testing Rake Tasks in Rails]({{ site.baseurl }}{% link _posts/2018-02-08-test_rake_tasks_rails.md %})

# All Blog Posts

{% for post in site.posts %}
  * [ {{ post.title }} ]({{ post.url }}) <time class="archive-date">{{ post.date | date: '%b %Y' }}</time>

{% endfor %}
