# frozen_string_literal: true

class Artist
  API_KEY = "my_friend_my_friend"
  API_URL = "https://api.phish.net/v3/artists/all?apikey=#{API_KEY}"

  # The name of the artist.
  # @return [String] the name of the artist, e.g. "Mike Gordan"
  attr_reader :name

  # The Phish.net url to the artist page.
  # @return [String] the url of the artist
  attr_reader :link

  # The Phish.net artistid of the artist.
  # @return [Integer] the artistid of the artist
  attr_reader :id

  def initialize(attributes)
    @name = attributes['name']
    @link = attributes['link']
    @id = attributes['artistid']
  end

  # Makes GET request to /get-all-artists end point and parses the response into
  # Artist plain old ruby objects.
  # {https://phishnet.api-docs.io/v3/artists/get-all-artists GET all artists}
  # @return [Array] the list of all artists objects returned from the api
  def self.all
    response = Faraday.get(API_URL)
    JSON.parse(response.body)['response']['data'].values.map { |attributes| self.new(attributes) }
  end
end
