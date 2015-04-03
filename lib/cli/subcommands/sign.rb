require 'thor'
require 'endpoints/track_details'

module SevenDigital
  module CLI
    class Sign < Thor
      desc 'track_details', 'track/details'
      def track_details(track_id)
        puts ::SevenDigital::Endpoints::TrackDetails.new(ENV['SEVENDIGITAL_CONSUMER_KEY']).generate_url(track_id)
      end
    end
  end
end
