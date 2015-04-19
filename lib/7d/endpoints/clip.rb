require '7d/endpoint'

module SevenDigital
  module Endpoints
    class Clip < Endpoint
      name 'clip'
      path '/clip/%<trackid>s'
      host 'previews.7digital.com'

      protection :requires_signing

      parameter :trackid, 'Track ID', type: :integer, required: true
      parameter :country, 'Country', type: :string, default: 'GB'
    end
  end
end
