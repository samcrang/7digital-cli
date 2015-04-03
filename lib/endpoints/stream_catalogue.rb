require 'oauth'

module SevenDigital
  module Endpoints
    class StreamCatalogue
      def initialize(consumer_key, consumer_secret)
        @consumer_key = consumer_key
        @consumer_secret = consumer_secret
      end

      def generate_url(track_id)
        request = OAuth::RequestProxy.proxy('method' => :GET, 'uri' => 'https://stream.svc.7digital.net/stream/catalogue', 'parameters' =>
          {
            'oauth_consumer_key' => @consumer_key,
            'oauth_timestamp' => OAuth::Helper.generate_timestamp,
            'oauth_nonce' => OAuth::Helper.generate_key,
            'oauth_signature_method' => 'HMAC-SHA1',
            'oauth_version' => '1.0',
            'country' => 'GB',
            'trackId' => track_id
          }
        )

        request.sign! consumer_secret: @consumer_secret
        request.signed_uri
      end
    end
  end
end
