

I want a ruby script that I can run (as a rake task) in my terminal like:

```
$ rake newdraft "my-desired-new-path" "My Desired Subject"
```

And it touches a new file in the `_drafts/` folder with the path and subject inserted appropriately, and, critically _it inserts some content intelligently_. 

That content, for now, could be a duplicate of `_post_template.md`, which is:

```
---
layout: post
title:  "Title"
description: "description about this post"
date:  2017-12-26 06:00:00 -0700
crosspost_to_medium: false
categories: [category]
tags: [tag1, tag2]
permalink: perma_link
image: /images/title_image.jpg
---


Text

<!--more-->

More text

```


Tiny little task. 

I'll build it up, sequentially. Here's my current plan:

- Add a `Rakefile`
- have it run raw Ruby
- use the `Dir` and/or the `File` class. Right? Seems like a good place to start?

And I'd start with just writing a script. No classes or OO stuff.

```ruby

def copy_rename_file(params)
  text = File.read("drafts/_a_post_template")
  todays_date = DateTime.now.strftime("mm-dd-yyy")
  new_file_title = todays_date.to_s
  new_file_content = text
  File.write("a+", some_other_stuff) do |file|
    file.title = new_file_title
    file.content = new_file_content
  end
end

```

How's that for a naïve implementation? I just drafted the above document in the last 6 minutes, I'm going to take another 10 minute stab at it in a few minutes. 