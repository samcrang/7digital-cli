require 'spec_helper'

describe 'TrackDetails' do
  subject { ::SevenDigital::Endpoints::TrackDetails.new(ENV['SEVENDIGITAL_CONSUMER_KEY']) }

  describe '#generate_url' do
    it 'should return a signed url' do
      uri = URI(subject.generate_url(track_id: 1234))

      res = Net::HTTP.get_response(uri)

      expect(res.code).to eq('200')
      expect(res.content_type).to eq('application/xml')
      expect(res.body).to include('Everyday Struggle')
    end
  end
end
