# frozen_string_literal: true

class Attendance
  API_KEY = "my_friend_my_friend"
  API_URL = "https://api.phish.net/v3/attendance/get?apikey=#{API_KEY}"

  attr_reader :profile

  attr_reader :user_id

  attr_reader :username

  def initialize(attributes)
    @profile = attributes['profile']
    @user_id = attributes['uid']
    @username = attributes['username']
  end

  # Makes GET request to /get-all-artists end point and parses the response into
  # Artist plain old ruby objects.
  # {https://phishnet.api-docs.io/v3/artists/get-all-artists GET all artists}
  # @return [Array] the list of all artists objects returned from the api
  def self.all
    response = Faraday.get(API_URL)
    JSON.parse(response.body)['response']['data'].map { |attributes| self.new(attributes) }
  end
end
