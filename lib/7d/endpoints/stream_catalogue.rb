require '7d/endpoints/helpers/require_signing'

module SevenDigital
  module Endpoints
    class StreamCatalogue
      include Helpers::RequireSigning

      def url(_ = nil)
        @url = 'https://stream.svc.7digital.net/stream/catalogue'
      end

      def generate_url(track_id, format_id, country)
        sign trackid: track_id, formatid: format_id, country: country
      end
    end
  end
end
