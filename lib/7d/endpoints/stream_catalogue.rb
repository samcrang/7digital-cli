require '7d/endpoints/helpers/require_signing'

module SevenDigital
  module Endpoints
    class StreamCatalogue
      include Helpers::RequireSigning

      def initialize(consumer_key, consumer_secret)
        @consumer_key = consumer_key
        @consumer_secret = consumer_secret
        @url = 'https://stream.svc.7digital.net/stream/catalogue'
      end

      def generate_url(track_id)
        sign trackid: track_id
      end
    end
  end
end
