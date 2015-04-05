require '7d/endpoints/helpers/require_signing_with_user'

module SevenDigital
  module Endpoints
    class StreamSubscription
      include Helpers::RequireSigningWithUser

      def url(_ = nil)
        'https://stream.svc.7digital.net/stream/subscription'
      end

      def generate_url(track_id)
        sign trackid: track_id
      end
    end
  end
end
