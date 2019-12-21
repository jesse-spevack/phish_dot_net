# frozen_string_literal: true

class Attendance < ApiMethodBase
  API_PATH = "attendance/get"

  # The profile url of the attendee.
  # @return [String] the profile url of the attendee, e.g. "http://phish.net/user/phan198"
  attr_reader :profile

  # The user id of the attendee.
  # @return [String] the user id of the attendee, e.g. "555"
  attr_reader :user_id

  # The username of the attendee.
  # @return [String] the username of the attendee, e.g. "phan1983"
  attr_reader :username

  def initialize(attributes)
    @profile = attributes['profile']
    @user_id = attributes['uid']
    @username = attributes['username']
  end

  class << self

    # Makes GET request to https://api.phish.net/v3/attendance/get end point
    # and parses the response into Attendance plain old ruby objects.
    # {https://phishnet.api-docs.io/v3/attendance/get-all-artists GET all artists}
    # @return [Array] the list of all artists objects returned from the api
    def all
      from_response(JSON.parse(connection.get.body)['response']['data'])
    end

    # Makes GET request to https://api.phish.net/v3/attendance/get end point
    # with show id or show date parameter. When both show id and show date paramaters
    # are supplied, show id is used, as per phish.net api documentation.
    # {https://phishnet.api-docs.io/v3/attendance/get-all-artists GET all artists}
    # @return [Array] the list of all artists objects returned from the api
    def where(show_id: nil, show_date: nil)
      response = connection.get do |request|
        request.params['showid'] = show_id
        request.params['showdate'] = show_date
      end

      from_response(JSON.parse(response.body)['response']['data'])
    end

    def path
      API_PATH
    end
  end
end
