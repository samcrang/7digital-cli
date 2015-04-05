module SevenDigital
  module Endpoints
    module Helpers
      module RequireConsumerKey
        def initialize(consumer_key)
          @consumer_key = consumer_key
        end

        def sign(parameters)
          qs = parameters.reduce('') do |memo, (key, val)|
            memo + "&#{key}=#{val}"
          end

          "#{url(parameters)}?oauth_consumer_key=#{@consumer_key}#{qs}"
        end
      end
    end
  end
end
