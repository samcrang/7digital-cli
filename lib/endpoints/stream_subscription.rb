require 'endpoints/helpers/require_signing_with_user'

module SevenDigital
  module Endpoints
    class StreamSubscription
      include Helpers::RequireSigningWithUser

      def initialize(consumer_key, consumer_secret, token_key, token_secret)
        @consumer_key = consumer_key
        @consumer_secret = consumer_secret
        @token_key = token_key
        @token_secret = token_secret
        @url = 'https://stream.svc.7digital.net/stream/subscription'
      end
    end
  end
end
