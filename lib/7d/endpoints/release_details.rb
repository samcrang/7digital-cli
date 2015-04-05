require '7d/endpoints/helpers/require_consumer_key'

module SevenDigital
  module Endpoints
    class ReleaseDetails
      include Helpers::RequireConsumerKey

      def url(_ = nil)
        'https://api.7digital.com/1.2/release/details'
      end

      def generate_url(release_id)
        sign releaseid: release_id
      end
    end
  end
end
