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
            opt :trackid, 'Track ID', type: :integer, required: true
          end
          @signature_generator_factory.find(endpoint).generate_url(opts[:trackid])

        when 'release/details'
          opts = Trollop.options args do
            opt :releaseid, 'Release ID', type: :integer, required: true
            opt :country, 'Country', type: :string, default: 'GB'
          end
          @signature_generator_factory.find(endpoint).generate_url(opts[:releaseid], opts[:country])

        when 'clip'
          opts = Trollop.options args do
            opt :trackid, 'Track ID', type: :integer, required: true
            opt :country, 'Country', type: :string, default: 'GB'
          end
          @signature_generator_factory.find(endpoint).generate_url(opts[:trackid], opts[:country])

        when 'stream/subscription'
          opts = Trollop.options args do
            opt :trackid, 'Track ID', type: :integer, required: true
            opt :formatid, 'Format ID', type: :integer, default: 26
            opt :country, 'Country', type: :string, default: 'GB'
          end
          @signature_generator_factory.find(endpoint).generate_url(opts[:trackid], opts[:formatid], opts[:country])

        when 'stream/catalogue'
          opts = Trollop.options args do
            opt :trackid, 'Track ID', type: :integer, required: true
            opt :formatid, 'Format ID', type: :integer, default: 26
            opt :country, 'Country', type: :string, default: 'GB'
          end
          @signature_generator_factory.find(endpoint).generate_url(opts[:trackid], opts[:formatid], opts[:country])
        end
      end
    end
  end
end
