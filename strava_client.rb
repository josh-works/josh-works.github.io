require 'strava-ruby-client'
require 'strava-ruby-cli'

CLIENT_ID = "63764"
CLIENT_SECRET = ""

ACCESS_TOKEN = "abc" # from http://localhost:4242


# taken from https://www.strava.com/settings/api

client = Strava::OAuth::Client.new(
    client_id: CLIENT_ID,
    client_secret: CLIENT_SECRET
)
  
redirect_url = client.authorize_url(
redirect_uri: 'https://example.com/oauth',
approval_prompt: 'force',
response_type: 'code',
scope: 'activity:read_all',
state: 'magic'
)

response = client.oauth_token(code: '')


# client = Strava::Api::Client.new(
#     access_token: ACCESS_TOKEN
#   )


# activity = client.activity(8359747724)
require "pry";binding.pry