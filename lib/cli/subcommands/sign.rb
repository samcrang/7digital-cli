require 'thor'
require 'endpoints/track_details'
require 'endpoints/release_details'
require 'endpoints/clip'
require 'endpoints/stream_catalogue'

module SevenDigital
  module CLI
    class Sign < Thor
      desc 'track_details', 'track/details'
      def track_details(track_id)
        puts ::SevenDigital::Endpoints::TrackDetails.new(ENV['SEVENDIGITAL_CONSUMER_KEY']).generate_url(track_id)
      end

      desc 'release_details', 'release/details'
      def release_details(release_id)
        puts ::SevenDigital::Endpoints::ReleaseDetails.new(ENV['SEVENDIGITAL_CONSUMER_KEY']).generate_url(release_id)
      end

      desc 'clip', 'clip'
      def clip(track_id)
        puts ::SevenDigital::Endpoints::Clip.new(ENV['SEVENDIGITAL_CONSUMER_KEY'], ENV['SEVENDIGITAL_CONSUMER_SECRET']).generate_url(track_id)
      end

      desc 'stream_catalogue', 'stream/catalogue'
      def stream_catalogue(track_id)
        puts ::SevenDigital::Endpoints::StreamCatalogue.new(ENV['SEVENDIGITAL_CONSUMER_KEY'], ENV['SEVENDIGITAL_CONSUMER_SECRET']).generate_url(track_id)
      end
    end
  end
end
