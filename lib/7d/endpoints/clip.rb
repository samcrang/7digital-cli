require '7d/endpoints/helpers/require_signing'

module SevenDigital
  module Endpoints
    class Clip
      include Helpers::RequireSigning

      def initialize(consumer_key, consumer_secret)
        @consumer_key = consumer_key
        @consumer_secret = consumer_secret
      end

      def generate_url(track_id, country)
        @url = "https://previews.7digital.com/clip/#{track_id}"
        sign country: country
      end
    end
  end
end
