# frozen_string_literal: true

class ApiMethodBase
  API_KEY = 'PHISH_DOT_NET_API_KEY'

  class << self
    def connection()
      @connection ||= Faraday.new(url: url)
    end

    def url
      "https://api.phish.net/v3/#{path}?apikey=#{ENV[API_KEY]}"
    end

    def from_response(response)
      response.map { |attributes| self.new(attributes) }
    end
  end
end
