---
---

Let's explore a minimum viable product of [https://www.ruby-toolbox.com/projects/strava-ruby-client](https://www.ruby-toolbox.com/projects/strava-ruby-client).

I would prefer to be running commands in a Pry console ASAP, so lets go there:

```
gem install strava-ruby-client
```

Head over to the docs: [https://github.com/dblock/strava-ruby-client](https://github.com/dblock/strava-ruby-client)

Open up a pry session, and lets `require` an 'interaction' file:

```shell
pry -r ./strava-client.rb
```
That should put you in a ruby console. What should we put in the file?

At minimum, a `require` statement and probably an API key or two:
```ruby
require 'strava-ruby-client'
API_KEY = "" # we'll get this from strava later as we work through the docs, probably

# tbd

```

I've used the Strava API and Oauth a bit here: [https://github.com/josh-works/strava_run_polylines_osm/tree/main](https://github.com/josh-works/strava_run_polylines_osm/tree/main). The notes are haphazard.

I read the docs, ended up with this in the file I'm running in pry:

```ruby
require 'strava-ruby-client'

ACCESS_TOKEN = "1234" 
# taken from https://www.strava.com/settings/api

client = Strava::Api::Client.new(
    access_token: ACCESS_TOKEN
  )
```
Fire it up as a rails console session:

```ruby
client = Strava::Api::Client.new(
    access_token: ACCESS_TOKEN
)

# next is the line from the docs, I knew the activity_id would not be found
activity = client.activity(1982980795)
# 404

# found an activity ID from my own recent activity:
# https://www.strava.com/activities/8359747724
activity = client.activity(8359747724)
# 404 womp I have to authenticate this client now... 

```

Lets poke around the docs for how to get a different/better access token. I found https://github.com/dblock/strava-ruby-client#get-authenticated-athlete via the index.

Looks like I can't just call `client.athlete`, I never gave it more than an access token...

![strava_api_works](/images/2023-01-09-strava-01.jpg)

Dang. It works. Lets carry onward. Lets try to make an activity per the API

```ruby
activity = client.create_activity(
  name: 'Afternoon Run',
  sport_type: 'Run',
  start_date_local: Time.now,
  elapsed_time: 1234, # in seconds
  description: 'Test run.',
  distance: 1000 # in meters
)
# returned Strava::Errors::Fault: Authorization Error
```

I wonder if `client.athlete` is authenticated. :thinking-face:

Ah, yes, I remember reading about [https://github.com/dblock/strava-ruby-cli](https://github.com/dblock/strava-ruby-cli)

![strava ruby cli](images/2023-01-09-strava-cli.jpg)

I updated the `access_token` in my script to be the returned access token, lets see if I can get the activity now...

No dice. Let's pause here, think a bit, and carry onward tomorrow!

-----------------

I'm hoping to get `client.athlete_activites` listed. I need a better token, so lets play with https://github.com/dblock/strava-ruby-cli#authentication

```
strava run athlete.username
--client_id 63764
--client_secret 2e6c5168e3b97a9c0975e5377041b8a416b4fbf8 
--scope=activity:read
```

---------------------

## Session 3

Use `strava-ruby-cli` to get an access token and use it on subsequent requests. I'd like to generate data on my most recent strava activity.

```shell
strava --scope=activity:read run athlete_activities.first
# get the access_token from the browser after authing (seems clunky)
strava --access_token=ac6b1fdfd60cc0c3d2fd1aa52d2e6bf7bcfef664 run athlete_activities.first.name
# Big Day!
```

Bam. It worked. Now lets get this in my little script...

and I got it working. First, the script:

```ruby
# strava_client.rb
require 'strava-ruby-client'
require 'strava-ruby-cli'

CLIENT_ID = "1234"
CLIENT_SECRET = "abcd" # secret from https://www.strava.com/settings/api"
ACCESS_TOKEN = "abcd" # from http://localhost:4242/?state=&code=f59&scope=read,read_all

Strava::Api.configure do |config|
  config.access_token = ACCESS_TOKEN # Strava access token
end

Strava::OAuth.configure do |config|
  config.client_id = CLIENT_ID
  config.client_secret = CLIENT_SECRET
end

client = Strava::Api::Client.new()

athlete = client.athlete
p "athlete.name:"
p athlete.name

activities = client.athlete_activities
p "activities count: "
p activities.count

activity = activities.first
pp "name: " + activity.name
pp "distance: " + activity.distance.to_i.to_s
pp "total_photo_count: " + activity.total_photo_count.to_s
pp "map.summary_polyline: " + activity.map.summary_polyline 
```

Here's how it looks in my terminal: 

![running this little script](images/2023-01-11-run-strava-script.jpg)


