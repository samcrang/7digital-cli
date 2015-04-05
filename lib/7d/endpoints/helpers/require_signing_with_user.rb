require 'oauth'

module SevenDigital
  module Endpoints
    module Helpers
      module RequireSigningWithUser
        def initialize(consumer_key, consumer_secret, token_key, token_secret)
          @consumer_key = consumer_key
          @consumer_secret = consumer_secret
          @token_key = token_key
          @token_secret = token_secret
        end

        def sign(parameters)
          user_params = {}

          parameters.each do |key, val|
            user_params[key.to_s] = val
          end

          all_params = {
            'oauth_consumer_key' => @consumer_key,
            'oauth_token' => @token_key,
            'oauth_timestamp' => OAuth::Helper.generate_timestamp,
            'oauth_nonce' => OAuth::Helper.generate_key,
            'oauth_signature_method' => 'HMAC-SHA1',
            'oauth_version' => '1.0'
          }.merge(user_params)

          request = OAuth::RequestProxy.proxy('method' => :GET, 'uri' => url(parameters), 'parameters' => all_params)

          request.sign! consumer_secret: @consumer_secret, token_secret: @token_secret
          request.signed_uri
        end
      end
    end
  end
end
