module SevenDigital
  module Endpoints
    class ReleaseDetails
      def initialize(consumer_key)
        @consumer_key = consumer_key
      end

      def generate_url(release_id)
        "https://api.7digital.com/1.2/release/details?releaseId=#{release_id}&oauth_consumer_key=#{@consumer_key}"
      end
    end
  end
end
