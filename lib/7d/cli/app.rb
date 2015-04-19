require 'trollop'

require '7d/signer'

require '7d/endpoints/clip'
require '7d/endpoints/track_details'
require '7d/endpoints/release_details'
require '7d/endpoints/stream_catalogue'
require '7d/endpoints/stream_subscription'

module SevenDigital
  module CLI
    class App
      def run(args)
        subcommand = args.shift

        case subcommand
        when 'sign'
          return sign_subcommand(args)
        end
      end

      def sign_subcommand(args)
        endpoint_name = args.shift

        endpoints = ObjectSpace.each_object(Class).select { |x| x < ::SevenDigital::Endpoint }
        endpoint = endpoints.find { |x| x.name == endpoint_name }

        opts = Trollop.options args do
          endpoint.parameters.each do |k, v|
            opt k, v[:description], v[:options]
          end
        end

        ::SevenDigital::Signer.new(ENV['SEVENDIGITAL_CONSUMER_KEY'], ENV['SEVENDIGITAL_CONSUMER_SECRET'], ENV['SEVENDIGITAL_TOKEN'], ENV['SEVENDIGITAL_TOKEN_SECRET']).sign(endpoint.build_request(opts))
      end
    end
  end
end
