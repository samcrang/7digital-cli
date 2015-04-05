require '7d/endpoints/helpers/require_consumer_key'

module SevenDigital
  module Endpoints
    class TrackDetails
      include Helpers::RequireConsumerKey

      def initialize(consumer_key)
        @consumer_key = consumer_key
        @url = 'https://api.7digital.com/1.2/track/details'
      end

      def generate_url(track_id)
        sign trackid: track_id
      end
    end
  end
end
