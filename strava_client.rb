require 'strava-ruby-client'
require 'strava-ruby-cli'

CLIENT_ID = "63764"
CLIENT_SECRET = "2e6c5168e3b97a9c0975e5377041b8a416b4fbf8"
ACCESS_TOKEN = "e9eec637f0e4c5fa583253709b76a8b5b50e2af7" # http://localhost:4242

Strava::Api.configure do |config|
  config.access_token = ACCESS_TOKEN # Strava access token
end

Strava::OAuth.configure do |config|
  config.client_id = CLIENT_ID
  config.client_secret = CLIENT_SECRET
end

client = Strava::Api::Client.new()
# client = Strava::OAuth::Client.new(
#   client_id: CLIENT_ID,
#   client_secret: CLIENT_SECRET
# )


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

File.open('activities.txt', 'w') do |f|
  activities.each do |a|
    f.write "#{a.name}, #{a.map.summary_polyline}\n"
  end
end



# require'pry';binding.pry
