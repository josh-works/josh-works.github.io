---
layout: post
title:  "How To Procfile: Run Just a Single Process"
date:  2019-02-21 01:00:00 -0700
crosspost_to_medium: true
categories: [programming]
tags: [rails, tools]
permalink: procfile-run-a-single-process
---

Lets say you've got something like this in your Procfile:
```
web:          PORT=3000 RAILS_ENV=development bundle exec puma -C ./config/puma_development.rb -e development
devlog:       tail -f ./log/development.log
mailcatcher:  ruby -rbundler/setup -e "Bundler.clean_exec('mailcatcher', '--foreground')"%
```

And you want to run _just_ the stuff in the `web` line. 

Old Josh would have `cat`ed the `procfile`, and copy-pasted most of the top line into the terminal.

New Josh knows better.

```
$ foreman start web 
```

If I wanted to see just the devlog, I could do:

```
foreman start devlog
``` 

I knew this was possible, I just kept getting the syntax wrong. For example, I tried `foreman web`, `foreman devlog`.

Now I know. And so do you. 

### Additional Reading

- I pieced this together from conversational snippets I heard at work, and [Heroku docs on `The Procfile` ](https://devcenter.heroku.com/articles/procfile)