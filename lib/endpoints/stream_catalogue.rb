require 'endpoints/helpers/require_signing'

module SevenDigital
  module Endpoints
    class StreamCatalogue
      include Helpers::RequireSigning

      def initialize(consumer_key, consumer_secret)
        @consumer_key = consumer_key
        @consumer_secret = consumer_secret
        @url = 'https://stream.svc.7digital.net/stream/catalogue'
      end
    end
  end
end
