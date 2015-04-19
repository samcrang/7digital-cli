require '7d/endpoint'

module SevenDigital
  module Endpoints
    class ReleaseDetails < Endpoint
      name 'release/details'
      path '/1.2/release/details'

      protection :requires_consumer_key

      parameter :releaseid, 'Release ID', type: :integer, required: true
      parameter :country, 'Country', type: :string, default: 'GB'
    end
  end
end
