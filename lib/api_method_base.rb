# frozen_string_literal: true

class ApiMethodBase
  API_KEY = 'my_friend_my_friend'

  class << self
    def connection()
      @connection ||= Faraday.new(url: url)
    end

    def url
      "https://api.phish.net/v3/#{path}?apikey=#{API_KEY}"
    end

    def from_response(response)
      response.map { |attributes| self.new(attributes) }
    end
  end
end
