require '7d/endpoint'

module SevenDigital
  module Endpoints
    class StreamSubscription < Endpoint
      name 'stream/subscription'
      path '/stream/subscription'
      host 'stream.svc.7digital.net'

      protection :requires_signing_with_user

      parameter :trackid, 'Track ID', type: :integer, required: true
      parameter :formatid, 'Format ID', type: :integer, default: 26
      parameter :country, 'Country', type: :string, default: 'GB'
    end
  end
end
