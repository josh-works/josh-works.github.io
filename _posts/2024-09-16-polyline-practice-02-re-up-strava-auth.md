---
layout: post
title: Practicing with Polylines Part 2 - Get Your Data (as a polyline) From Strava
published: true
description: "Getting reps with polylines"
date:  2025-09-16 06:00:00 -0700
categories: [data-visualization]
tags: [polylines, mobility_networks]
permalink: /polyline-practice-again-strava-auth
issue_id: '86'
---

Last time, I did a [minimum first pass]( {{ site.baseurl  }}{% link _posts/2024-09-10-polyline-practice-01.md %}) on rendering a polyline on a map. 

It wasn't just any polyline, though, it was a path of a walk I went on. (Technically, just a fragment of a path).

_this is a heavy draft, I've had issues getting this all working well in the past, still have to suss it today._

the dictionary definition of a polyline is 'some string that decodes into lat/long pairs that can be traced on a map'. I'm interested in the lines I've always looked at, which were made by Strava, from a device on my person, while I was walking, or biking, or riding my scooter.

So it's data, but it's also extremely-specific-to-me location data, and it obviously has the capacity to be fascinating. 

_My_ data is likely to be boring to you, though. 

What might not be boring would be _your_ data. 

You could go on a walk right now, with the [Strava app](https://www.strava.com/) running on your phone, save the activity, and a moment later be looking at a map with that new activity data rendered upon it.

Lets do just that. Like any good thing on the internet, there's others who have done this thing in a concise and better-than-i-could way. 

These were my first sources and inspiration for this project:

- https://www.markhneedham.com/blog/2017/04/29/leaflet-strava-polylines-osm/
- https://gist.github.com/mneedham/34b923beb7fd72f8fe6ee433c2b27d73

Today, lets quickly get a working auth 'thing' set up, close-enough to a copy/paste ruby script, so you can run a script or run some ruby commands in an IRB terminal, and get your data back from Strava, however you want. The goal being a polyline you can copy and paste, yourself, into a html document and get a cool map. 

First, download the [Strava](https://www.strava.com) app (android/iphone whatever: https://www.strava.com/)

Create an account, and then go on a ten minute walk, from wherever you're sitting right now, or a walk you take between now and when you sit down at your laptop again.

You can keep working through this guide without activity on your Strava account. If you get far enough to get [no available data] for your activities in the Strava API, you're doing great. ()

Next, go to [https://www.strava.com/settings/api](https://www.strava.com/settings/api) and follow the prompts to get an API application set up.

When you have your `client_id` and `client_secret` available, you're ready to continue.

We might use [https://github.com/dblock/strava-ruby-client](https://github.com/dblock/strava-ruby-client) at some point.

We're going to do some creative things. Paste this into a pry session.

do `gem install 'strava-ruby-client'` first.

Then, fire up a pry session or irb session in your terminal. I recommend a text file where you can keep text for copy/paste accessibility. Copy the below text into your own blank file, update the client_id and client_secret variables (don't commit any of this to github, you can make it an environment variable later. Or now.)

```ruby
require 'strava-ruby-client'

client = Strava::OAuth::Client.new(
  client_id: "id",
  client_secret: "secret"
)

redirect_url = client.authorize_url(
  redirect_uri: 'https://localhost:4000/oauth',
  approval_prompt: 'force',
  response_type: 'code',
  scope: 'activity:read_all',
  state: 'magic'
)
```

this did not work:

https://www.strava.com/oauth/authorize?approval_prompt=force&client_id=63764&redirect_uri=developers.strava.com&response_type=code&scope=activity%3Aread_all&state=magic


this worked:

https://www.strava.com/oauth/authorize?client_id=my_client_id&response_type=code&redirect_uri=http://localhost/exchange_token&approval_prompt=force&scope=activity:read_all

Look in the URL for "code" variable, and carry it on to the next step, where we give Strava this code, and ask for a token:

```ruby
require "uri"
require "net/http"

url = URI("https://www.strava.com/oauth/token?client_id=63764&client_secret=2e6c5168e3b97a9c0975e5377041b8a416b4fbf8&refresh_token=37c0291f7d6fd4031f5043589751adf898b6c914&grant_type=refresh_token")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Post.new(url)

response = https.request(request)
puts response.read_body


# look at the response before continuing

```

In following that link, and approving the app, you've given your own app access to your Strava account data. Finish the oauth "flow" to view your data.

With that code, in Postman you can now make a request 