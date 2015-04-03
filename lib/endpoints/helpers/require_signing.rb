require 'oauth'

module SevenDigital
  module Endpoints
    module Helpers
      module RequireSigning
        def generate_url(parameters)
          user_params = parameters.map do |key, val|
            [key.to_s.sub('_', ''), val]
          end.to_h

          all_params = {
            'oauth_consumer_key' => @consumer_key,
            'oauth_timestamp' => OAuth::Helper.generate_timestamp,
            'oauth_nonce' => OAuth::Helper.generate_key,
            'oauth_signature_method' => 'HMAC-SHA1',
            'oauth_version' => '1.0',
            'country' => 'GB'
          }.merge(user_params)

          request = OAuth::RequestProxy.proxy('method' => :GET, 'uri' => @url, 'parameters' => all_params)

          request.sign! consumer_secret: @consumer_secret
          request.signed_uri
        end
      end
    end
  end
end
