require 'trollop'

module SevenDigital
  module CLI
    class App
      def initialize(signature_generator_factory)
        @signature_generator_factory = signature_generator_factory
      end

      def run(args)
        parse(args)
      end

      private

      def parse(args)
        subcommand = args.shift

        case subcommand
        when 'sign'
          return sign_subcommand(args)
        end
      end

      def sign_subcommand(args)
        endpoint = args.shift

        case endpoint
        when 'track/details'
          opts = Trollop.options args do
            opt :trackid, 'Track ID', type: :string
          end
          @signature_generator_factory.find(endpoint).generate_url(opts[:trackid])

        when 'release/details'
          opts = Trollop.options args do
            opt :releaseid, 'Release ID', type: :string
          end
          @signature_generator_factory.find(endpoint).generate_url(opts[:releaseid])

        when 'clip'
          opts = Trollop.options args do
            opt :trackid, 'Track ID', type: :string
          end
          @signature_generator_factory.find(endpoint).generate_url(opts[:trackid], 'GB')

        when 'stream/subscription'
          opts = Trollop.options args do
            opt :trackid, 'Track ID', type: :string
          end
          @signature_generator_factory.find(endpoint).generate_url(opts[:trackid])

        when 'stream/catalogue'
          opts = Trollop.options args do
            opt :trackid, 'Track ID', type: :string
          end
          @signature_generator_factory.find(endpoint).generate_url(opts[:trackid])
        end
      end
    end
  end
end
