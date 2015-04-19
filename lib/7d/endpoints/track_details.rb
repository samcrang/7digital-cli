require '7d/endpoint'

module SevenDigital
  module Endpoints
    class TrackDetails < Endpoint
      name 'track/details'
      path '/1.2/track/details'

      protection :requires_consumer_key

      parameter :trackid, 'Track ID', type: :integer, required: true
      parameter :country, 'Country', type: :string, default: 'GB'
    end
  end
end
