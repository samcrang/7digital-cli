require 'oauth'

module SevenDigital
  class Signer
    def initialize(consumer_key, consumer_secret, token_key, token_secret)
      @consumer_key = consumer_key
      @consumer_secret = consumer_secret
      @token_key = token_key
      @token_secret = token_secret
    end

    def sign(request)
      case request[:protection]
      when :requires_consumer_key
        requires_consumer_key(request[:uri], request[:parameters])
      when :requires_signing
        requires_signing(request[:uri], request[:parameters])
      when :requires_signing_with_user
        requires_signing_with_user(request[:uri], request[:parameters])
      else
        raise ArgumentError
      end
    end

    private

    def requires_consumer_key(uri, parameters)
      qs = parameters.reduce('') do |memo, (key, val)|
        memo + "&#{key}=#{val}"
      end

      "#{uri}?oauth_consumer_key=#{@consumer_key}#{qs}"
    end

    def requires_signing(uri, parameters)
      user_params = {}

      parameters.each do |key, val|
        user_params[key.to_s] = val
      end

      all_params = {
        'oauth_consumer_key' => @consumer_key,
        'oauth_timestamp' => OAuth::Helper.generate_timestamp,
        'oauth_nonce' => OAuth::Helper.generate_key,
        'oauth_signature_method' => 'HMAC-SHA1',
        'oauth_version' => '1.0'
      }.merge(user_params)

      request = OAuth::RequestProxy.proxy('method' => :GET, 'uri' => uri, 'parameters' => all_params)

      request.sign! consumer_secret: @consumer_secret
      request.signed_uri
    end

    def requires_signing_with_user(uri, parameters)
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

      request = OAuth::RequestProxy.proxy('method' => :GET, 'uri' => uri, 'parameters' => all_params)

      request.sign! consumer_secret: @consumer_secret, token_secret: @token_secret
      request.signed_uri
    end
  end
end
