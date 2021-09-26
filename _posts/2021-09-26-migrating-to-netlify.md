---
layout: post
title:  "Migrating my Jekyll site to Netlify"
description: "Running into errors, recording for posterity"
date:  2021-09-26 06:00:00 -0700
crosspost_to_medium: false
categories: [jekyll]
tags: [jekyll]
permalink: migrating-to-netlify
image: /images/title_image.jpg
issue: 44
---

Troubleshooting Netilify deploy

Ugggh I moved [intermediateruby.com](https://intermediateruby.com) to Netlify a few months ago in like 10 minutes, so my primary site, `josh.works`, should take maybe 20, right?

I'm a few hours deep. Here's what I get when Netlify tries to build:

I should have done the following _first_, instead of last:


```
9:58:21 AM:   1. Build command from Netlify app                             
9:58:21 AM: ────────────────────────────────────────────────────────────────
9:58:21 AM: ​
9:58:21 AM: $ bundle exec jekyll build
9:58:22 AM: Configuration file: /opt/build/repo/_config.yml
9:58:22 AM:             Source: /opt/build/repo
9:58:22 AM:        Destination: /opt/build/repo/_site
9:58:22 AM:  Incremental build: disabled. Enable with --incremental
9:58:22 AM:       Generating...
9:58:23 AM:                     ------------------------------------------------
9:58:23 AM:       Jekyll 4.2.0   Please append `--trace` to the `build` command 
9:58:23 AM:                      for any additional information or backtrace. 
9:58:23 AM:                     ------------------------------------------------
9:58:23 AM: ​
9:58:23 AM: ────────────────────────────────────────────────────────────────
9:58:23 AM:   "build.command" failed                                        
9:58:23 AM: ────────────────────────────────────────────────────────────────
9:58:23 AM: ​
9:58:23 AM:   Error message
9:58:23 AM:   Command failed with exit code 1: bundle exec jekyll build
9:58:23 AM: ​
9:58:23 AM:   Error location
9:58:23 AM:   In Build command from Netlify app:
9:58:23 AM:   bundle exec jekyll build
9:58:23 AM: ​
9:58:23 AM:   Resolved config
9:58:23 AM:   build:
9:58:23 AM:     command: bundle exec jekyll build
9:58:23 AM:     commandOrigin: ui
9:58:23 AM:     publish: /opt/build/repo/_site
9:58:23 AM:     publishOrigin: ui
```

So, first thing I did was go into the `build settings` and update the `build` command, to append `--trace` to it:

![netlify build](/images/netlify-build.jpg)

Now I get:

```
10:18:23 AM: $ bundle exec jekyll build --trace
10:18:23 AM: Configuration file: /opt/build/repo/_config.yml
10:18:23 AM:             Source: /opt/build/repo
10:18:23 AM:        Destination: /opt/build/repo/_site
10:18:23 AM:  Incremental build: disabled. Enable with --incremental
10:18:23 AM:       Generating...
10:18:24 AM: /opt/build/cache/bundle/ruby/2.5.0/gems/jekyll-crosspost-to-medium-0.1.16/lib/jekyll-crosspost-to-medium.rb:44:in `generate': MediumCrossPostGenerator: Environment variables not found (ArgumentError)
	from /opt/build/cache/bundle/ruby/2.5.0/gems/jekyll-4.2.0/lib/jekyll/site.rb:193:in `block in generate'
	from /opt/build/cache/bundle/ruby/2.5.0/gems/jekyll-4.2.0/lib/jekyll/site.rb:191:in `each'
	from /opt/build/cache/bundle/ruby/2.5.0/gems/jekyll-4.2.0/lib/jekyll/site.rb:191:in `generate'
	from /opt/build/cache/bundle/ruby/2.5.0/gems/jekyll-4.2.0/lib/jekyll/site.rb:79:in `process'
	from /opt/build/cache/bundle/ruby/2.5.0/gems/jekyll-4.2.0/lib/jekyll/command.rb:28:in `process_site'
	from /opt/build/cache/bundle/ruby/2.5.0/gems/jekyll-4.2.0/lib/jekyll/commands/build.rb:65:in `build'
	from /opt/build/cache/bundle/ruby/2.5.0/gems/jekyll-4.2.0/lib/jekyll/commands/build.rb:36:in `process'
	from /opt/build/cache/bundle/ruby/2.5.0/gems/jekyll-4.2.0/lib/jekyll/command.rb:91:in `block in process_with_graceful_fail'
	from /opt/build/cache/bundle/ruby/2.5.0/gems/jekyll-4.2.0/lib/jekyll/command.rb:91:in `each'
	from /opt/build/cache/bundle/ruby/2.5.0/gems/jekyll-4.2.0/lib/jekyll/command.rb:91:in `process_with_graceful_fail'
	from /opt/build/cache/bundle/ruby/2.5.0/gems/jekyll-4.2.0/lib/jekyll/commands/build.rb:18:in `block (2 levels) in init_with_program'
	from /opt/build/cache/bundle/ruby/2.5.0/gems/mercenary-0.4.0/lib/mercenary/command.rb:221:in `block in execute'
	from /opt/build/cache/bundle/ruby/2.5.0/gems/mercenary-0.4.0/lib/mercenary/command.rb:221:in `each'
	from /opt/build/cache/bundle/ruby/2.5.0/gems/mercenary-0.4.0/lib/mercenary/command.rb:221:in `execute'
	from /opt/build/cache/bundle/ruby/2.5.0/gems/mercenary-0.4.0/lib/mercenary/program.rb:44:in `go'
	from /opt/build/cache/bundle/ruby/2.5.0/gems/mercenary-0.4.0/lib/mercenary.rb:21:in `program'
	from /opt/build/cache/bundle/ruby/2.5.0/gems/jekyll-4.2.0/exe/jekyll:15:in `<top (required)>'
	from /opt/build/cache/bundle/ruby/2.5.0/bin/jekyll:23:in `load'
	from /opt/build/cache/bundle/ruby/2.5.0/bin/jekyll:23:in `<main>'
	from /opt/build/cache/bundle/ruby/2.5.0/bin/ruby_executable_hooks:22:in `eval'
	from /opt/build/cache/bundle/ruby/2.5.0/bin/ruby_executable_hooks:22:in `<main>'
```

Nailed it - a gem I hardly use is missing an environment variable. I'm just going to delete it for now, and re-try.

[...]

Not worth trying to clean out the gem, I did `git rebase -i HEAD~~` to delete the last commit (deleting the `crosspost-to-medium` gem), and instead added the environment variables to Netlify. 

I just copied/pasted from my `.evn` (A hidden file, it's not tracked in Git, but I copied/obfuscated the values into `env.sample` in [this commit](https://github.com/josh-works/josh-works.github.io/commit/0d7eeb369d41034ffb67a784cc25e199af236b70))


...

Huzzah! The site builds. We're good to go.

-----------




### Related reading:

- [https://answers.netlify.com/t/support-guide-frequently-encountered-problems-during-builds/213](https://answers.netlify.com/t/support-guide-frequently-encountered-problems-during-builds/213)
- [https://answers.netlify.com/t/site-deploy-failed-need-guidance-please/32668/7](https://answers.netlify.com/t/site-deploy-failed-need-guidance-please/32668/7)