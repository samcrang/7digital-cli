require '7d/endpoints/helpers/require_consumer_key'

module SevenDigital
  module Endpoints
    class TrackDetails
      include Helpers::RequireConsumerKey

      def initialize(consumer_key)
        @consumer_key = consumer_key
        @url = 'https://api.7digital.com/1.2/track/details'
      end
    end
  end
end
