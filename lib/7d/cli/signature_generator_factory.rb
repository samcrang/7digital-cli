require '7d/endpoints/clip'
require '7d/endpoints/track_details'
require '7d/endpoints/release_details'
require '7d/endpoints/stream_catalogue'
require '7d/endpoints/stream_subscription'

module SevenDigital
  module CLI
    class SignatureGeneratorFactory
      def find(endpoint)
        case endpoint
        when 'track/details'
          ::SevenDigital::Endpoints::TrackDetails.new ENV['SEVENDIGITAL_CONSUMER_KEY']
        when 'release/details'
          ::SevenDigital::Endpoints::ReleaseDetails.new ENV['SEVENDIGITAL_CONSUMER_KEY']
        when 'clip'
          ::SevenDigital::Endpoints::Clip.new ENV['SEVENDIGITAL_CONSUMER_KEY'], ENV['SEVENDIGITAL_CONSUMER_SECRET']
        when 'stream/catalogue'
          ::SevenDigital::Endpoints::StreamCatalogue.new ENV['SEVENDIGITAL_CONSUMER_KEY'], ENV['SEVENDIGITAL_CONSUMER_SECRET']
        when 'stream/subscription'
          ::SevenDigital::Endpoints::StreamSubscription.new ENV['SEVENDIGITAL_CONSUMER_KEY'], ENV['SEVENDIGITAL_CONSUMER_SECRET'], ENV['SEVENDIGITAL_TOKEN'], ENV['SEVENDIGITAL_TOKEN_SECRET']
        end
      end
    end
  end
end
