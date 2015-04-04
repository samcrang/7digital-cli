require 'spec_helper'

describe 'ReleaseDetails' do
  subject { ::SevenDigital::Endpoints::ReleaseDetails.new(ENV['SEVENDIGITAL_CONSUMER_KEY']) }

  describe '#generate_url' do
    it 'should return a signed url' do
      uri = URI(subject.generate_url(release_id: 2345))

      res = Net::HTTP.get_response(uri)

      expect(res.code).to eq('200')
      expect(res.content_type).to eq('application/xml')
      expect(res.body).to include('Sound Affects')
    end
  end
end
