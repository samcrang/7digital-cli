require 'spec_helper'

describe 'ReleaseDetails' do
  subject { ::SevenDigital::Endpoints::ReleaseDetails.new(ENV['SEVENDIGITAL_CONSUMER_KEY']) }

  describe '#generate_url' do
    it 'should return a signed url' do
      res = Faraday.get(subject.generate_url(release_id: 2345))

      expect(res.status).to eq(200)
      expect(res.headers['Content-Type']).to eq('application/xml; charset=utf-8')
      expect(res.body).to include('Sound Affects')
    end
  end
end
