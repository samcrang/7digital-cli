require 'spec_helper'

describe 'TrackDetails' do
  subject { ::SevenDigital::Endpoints::TrackDetails.new(ENV['SEVENDIGITAL_CONSUMER_KEY']) }

  describe '#generate_url' do
    it 'should return a signed url' do
      res = Faraday.get(subject.generate_url(1234))

      expect(res.status).to eq(200)
      expect(res.headers['Content-Type']).to eq('application/xml; charset=utf-8')
      expect(res.body).to include('Everyday Struggle')
    end
  end
end
