require 'spec_helper'

describe 'StreamCatalogue' do
  subject { ::SevenDigital::Endpoints::StreamCatalogue.new(ENV['SEVENDIGITAL_CONSUMER_KEY'], ENV['SEVENDIGITAL_CONSUMER_SECRET']) }

  describe '#generate_url' do
    it 'should return a signed url', skip: using_demo_key? do
      res = Faraday.get(subject.generate_url(track_id: 1234))

      expect(res.status).to eq(200)
      expect(res.headers['Content-Type']).to eq('audio/mpeg')
    end
  end
end
