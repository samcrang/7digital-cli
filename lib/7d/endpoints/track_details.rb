require '7d/endpoints/helpers/require_consumer_key'

module SevenDigital
  module Endpoints
    class TrackDetails
      include Helpers::RequireConsumerKey

      def url(_ = nil)
        'https://api.7digital.com/1.2/track/details'
      end

      def generate_url(track_id, country)
        sign trackid: track_id, country: country
      end
    end
  end
end
