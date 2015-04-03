module SevenDigital
  module Endpoints
    class TrackDetails
      def initialize(consumer_key)
        @consumer_key = consumer_key
      end

      def generate_url(track_id)
        "https://api.7digital.com/1.2/track/details?trackId=#{track_id}&oauth_consumer_key=#{@consumer_key}"
      end
    end
  end
end
