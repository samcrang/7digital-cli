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
      def initialize(stdin=STDIN, stdout=STDOUT, stderr=STDERR, kernel=Kernel, env=ENV, signer=::SevenDigital::Signer)
        @stdin = stdin
        @stdout = stdout
        @stderr = stderr
        @kernel = kernel
        @env = env
        @signer = signer
      end

      def execute!(args)
        subcommand = args.shift

        case subcommand
        when 'sign'
          sign_subcommand(args)
        else
          show_main_help
        end
      end

      def sign_subcommand(args)
        endpoint_name = args.shift

        endpoints = ObjectSpace.each_object(Class).select { |x| x < ::SevenDigital::Endpoint }
        endpoint = endpoints.find { |x| x.name == endpoint_name }

        show_sign_help if endpoint.nil?

        opts = Trollop.options args do
          endpoint.parameters.each do |k, v|
            opt k, v[:description], v[:options]
          end
        end

        @stdout.puts @signer.new(@env['SEVENDIGITAL_CONSUMER_KEY'], @env['SEVENDIGITAL_CONSUMER_SECRET'], @env['SEVENDIGITAL_TOKEN'], @env['SEVENDIGITAL_TOKEN_SECRET']).sign(endpoint.build_request(opts))
      end

      private

      def show_main_help
        @stdout.puts "Subcommands:
  sign"
        @kernel.exit 1
      end

      def show_sign_help
        @stdout.puts "Endpoints:
  clip
  track/details"
        @kernel.exit 1
      end
    end
  end
end
