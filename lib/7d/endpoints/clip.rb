require '7d/endpoints/helpers/require_signing'

module SevenDigital
  module Endpoints
    class Clip
      include Helpers::RequireSigning

      def url(parameters = nil)
        "https://previews.7digital.com/clip/#{parameters[:track_id]}"
      end

      def generate_url(track_id, country)
        sign track_id: track_id, country: country
      end
    end
  end
end
