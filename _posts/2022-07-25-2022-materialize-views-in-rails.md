---
layout: post
title:  "Notes on using Materialize Views in Rails"
description: "I take notes for many reasons - top of the list is 'I do not feel very smart most days, need every piece of help I can get.'"
date:  2022-07-24 06:00:00 -0700
crosspost_to_medium: false
published: true
categories: [rails]
tags: [programming, rails, materialize_views]
permalink: 'materialize-views-in-rails'
image: /images/title_image.jpg
---

I've been doing occasional work with Materialized views in Rails. Capturing some notes.

## The Usual Steps

### copy/rename the view(s) I'm modifying

increment the version number by 1: `db/views/given_view_v04.sql` -> `db/views/given_view_v05.sql`

### write migration for each updated view


```
rails g migration update_given_view_to_version_5
```

```ruby
# frozen_string_literal: true
class UpdateGivenViewToVersion5 < ActiveRecord::Migration[6.0]
  def change
    ActiveRecord::Base.connection.execute 'SET statement_timeout = 0'

    update_view :given_view, version: 5, revert_to_version: 4, materialized: true
  end
end
```

## Resources/extra reading

- [Effectively Using Materialized Views in Ruby on Rails](https://pganalyze.com/blog/materialized-views-ruby-rails)
