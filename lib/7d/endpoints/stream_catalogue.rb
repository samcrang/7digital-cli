require '7d/endpoint'

module SevenDigital
  module Endpoints
    class StreamCatalogue < Endpoint
      name 'stream/catalogue'
      path '/stream/catalogue'
      host 'stream.svc.7digital.net'

      protection :requires_signing

      parameter :trackid, 'Track ID', type: :integer, required: true
      parameter :formatid, 'Format ID', type: :integer, default: 26
      parameter :country, 'Country', type: :string, default: 'GB'
    end
  end
end
