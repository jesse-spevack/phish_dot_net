# frozen_string_literal: true

require 'bundler/setup'
# Bundler.setup
require 'phish_dot_net'
require 'webmock/rspec'
require 'vcr'
require 'simplecov'
require 'faraday'
require 'pry'

WebMock.disable_net_connect!(allow_localhost: true)

SimpleCov.start do
  add_filter '/spec/'
  minimum_coverage 84
  minimum_coverage_by_file 26
end

# Ensure all /lib files are loaded so they will be included in test coverage report
Dir['./lib/**/*.rb'].sort.each { |file| require file }

VCR.configure do |c|
  c.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  c.configure_rspec_metadata!
  c.hook_into :webmock
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    # Prevent mocking / stubbing methods that do not exist
    mocks.verify_partial_doubles = true
  end

end
