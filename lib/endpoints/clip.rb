require 'endpoints/helpers/require_signing'

module SevenDigital
  module Endpoints
    class Clip
      include Helpers::RequireSigning

      def initialize(consumer_key, consumer_secret)
        @consumer_key = consumer_key
        @consumer_secret = consumer_secret
      end

      def generate_url(parameters)
        @url = "https://previews.7digital.com/clip/#{parameters[:track_id]}"
        super(parameters)
      end
    end
  end
end
