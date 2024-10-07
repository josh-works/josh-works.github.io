---
layout: post
title: Practicing with Polylines Part 2 - Get Your Data (as a polyline) From Strava
published: true
description: "Getting reps with polylines"
date:  2024-09-16 06:00:00 -0700
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

- [https://www.markhneedham.com/blog/2017/04/29/leaflet-strava-polylines-osm/](https://www.markhneedham.com/blog/2017/04/29/leaflet-strava-polylines-osm/)
- [https://gist.github.com/mneedham/34b923beb7fd72f8fe6ee433c2b27d73](https://gist.github.com/mneedham/34b923beb7fd72f8fe6ee433c2b27d73)

Today, I'm going to _try_ to 'quickly' get a working auth 'thing' set up, close-enough to a copy/paste ruby script, so you can run a script or run some ruby commands in an IRB terminal, and get your data back from Strava, including any activity data polyline strava has. 

The goal being a polyline you can copy and paste, yourself, into a html document and get a cool map, showing off a walk or journey you went on yourself. It's _strongly_ based on Mark Needham's stuff.

First, download the [Strava](https://www.strava.com) app (android/iphone whatever: https://www.strava.com/)

Create an account, and then go on a ten minute walk while tracking that as an activity in the strava app. Finish the walk, end the activity. It'll upload to Strava, and now we can use the Strava API to get that activity data back out and look at.


You can keep working through this guide without activity on your Strava account, so maybe plan on taking a ten minute walk in the next hour or so. 

## Set up a 'strava application'

Strava has apps, and you can give those apps permissions at a per-app basis. You'll set up an app that you'll then give permission to know certain things about your data.


So, to make the app account, and get your account id/ key, head to the developer settings. go to [https://www.strava.com/settings/api](https://www.strava.com/settings/api) and follow the prompts to get an API application set up.

When you have your `client_id` and `client_secret` available, you're ready to continue.

We might use [https://github.com/dblock/strava-ruby-client](https://github.com/dblock/strava-ruby-client) at some point.

## Authorize the app to access your strava data

You're going to need to generate a token (a refresh token and )

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

Look in the URL for "code" variable, and carry it on to the next step, where we give Strava this code, it's treated as a 'refresh token', and if we give strava a refresh token it'll give us back a valid access token that can then be included in the request authorization of every subsequent API call, and we'll get back data for the strava account identified by that access token. This is all 'just' 'basic' auth stuff, but it can get tricky sometimes. 

```ruby
require "uri"
require "net/http"

url = URI("https://www.strava.com/oauth/token?client_id=YOURCLIENTID&client_secret=CLIENT_SECRET&refresh_token=REFRESH_TOKEN&grant_type=refresh_token")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Post.new(url)

response = https.request(request)
puts response.read_body

# look at the response before continuing, save the `access_token`

```

In following that link, and approving the app, you've given your own app access to your Strava account data. Finish the oauth "flow" to view your data.

With that code, in Postman you can now make a request. 

To see if it works, you can also paste this into an IRB session:

```ruby
require "uri"
require "net/http"

url = URI("https://www.strava.com/api/v3/activities/")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Get.new(url)
request["Authorization"] = "Bearer ACCESS_TOKEN_FROM_PRIOR_STEP"

response = https.request(request)
puts response.read_body

```

boom. Look at your activities! The polyline(s) might be visible now. If so, phenominal! Save them to a text file, or a CSV, manually or automatically.

To get the detailed polyline, and not just the summary polyline, you need one more request:

```ruby
require "uri"
require "net/http"

url = URI("https://www.strava.com/api/v3/activities/YOUR_ACTIVITY_ID?include_all_efforts=true")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Get.new(url)
request["Authorization"] = "••••••"

response = https.request(request)
puts response.read_body

```

Does that work? I hope it does. 