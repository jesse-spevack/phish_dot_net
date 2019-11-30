# frozen_string_literal: true

class Artist
  API_KEY = "my_friend_my_friend"
  API_URL = "https://api.phish.net/v3/artists/all?apikey=#{API_KEY}"

  attr_reader :name,
              :link,
              :id

  def initialize(attributes)
    @name = attributes['name']
    @link = attributes['link']
    @id = attributes['artistid']
  end

  def self.all
    response = Faraday.get(API_URL)
    JSON.parse(response.body)['response']['data'].values.map { |attributes| self.new(attributes) }
  end
end
