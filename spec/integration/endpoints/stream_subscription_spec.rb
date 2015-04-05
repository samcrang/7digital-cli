require 'spec_helper'

describe 'StreamSubscription' do
  subject do
    ::SevenDigital::Endpoints::StreamSubscription.new(
      ENV['SEVENDIGITAL_CONSUMER_KEY'],
      ENV['SEVENDIGITAL_CONSUMER_SECRET'],
      ENV['SEVENDIGITAL_TOKEN'],
      ENV['SEVENDIGITAL_TOKEN_SECRET']
    )
  end

  describe '#generate_url' do
    it 'should return a signed url', skip: using_demo_key? do
      res = Faraday.get(subject.generate_url(1234))

      expect(res.status).to eq(200)
      expect(res.headers['Content-Type']).to eq('audio/mpeg')
    end
  end
end
