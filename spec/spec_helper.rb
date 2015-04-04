require 'faraday'

require '7d/endpoints/clip'
require '7d/endpoints/track_details'
require '7d/endpoints/release_details'
require '7d/endpoints/stream_catalogue'
require '7d/endpoints/stream_subscription'

def using_demo_key?
  ENV['SEVENDIGITAL_CONSUMER_KEY'].nil? || ENV['SEVENDIGITAL_CONSUMER_KEY'] == 'YOUR_KEY_HERE'
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  begin
    config.filter_run :focus
    config.run_all_when_everything_filtered = true
    config.warnings = false

    if config.files_to_run.one?
      config.default_formatter = 'doc'
    end

    config.order = :random

    Kernel.srand config.seed
  end
end
