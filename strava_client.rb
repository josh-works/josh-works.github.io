require 'strava-ruby-client'
require 'strava-ruby-cli'

CLIENT_ID = "63764"
CLIENT_SECRET = ""
ACCESS_TOKEN = "" # http://localhost:4242

Strava::Api.configure do |config|
  config.access_token = ACCESS_TOKEN # Strava access token
end

Strava::OAuth.configure do |config|
  config.client_id = CLIENT_ID
  config.client_secret = CLIENT_SECRET
end

client = Strava::Api::Client.new()

token_client = Strava::OAuth::Client.new(
  client_id: CLIENT_ID,
  client_secret: CLIENT_SECRET
)
response = token_client.oauth_token("")

require'pry';binding.pry

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

