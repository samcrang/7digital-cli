module SevenDigital
  module Endpoints
    module Helpers
      module RequireConsumerKey
        def sign(parameters)
          qs = parameters.reduce('') do |memo, (key, val)|
            memo + "&#{key.to_s.sub('_', '')}=#{val}"
          end

          "#{@url}?oauth_consumer_key=#{@consumer_key}#{qs}"
        end
      end
    end
  end
end
