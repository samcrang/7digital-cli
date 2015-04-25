require 'spec_helper'

describe ::SevenDigital::Endpoints::StreamSubscription do
  subject { described_class }
  let(:signer) { ::SevenDigital::Signer.new ENV['SEVENDIGITAL_CONSUMER_KEY'], ENV['SEVENDIGITAL_CONSUMER_SECRET'], ENV['SEVENDIGITAL_TOKEN'], ENV['SEVENDIGITAL_TOKEN_SECRET'] }

  describe '.build_request' do
    it 'should create a request object' do
      actual = subject.build_request(trackid: 1234, formatid: 26, country: 'GB')

      expect(actual[:uri]).to start_with('https://stream.svc.7digital.net/stream/subscription')
      expect(actual[:parameters]).to eq(
        trackid: 1234,
        formatid: 26,
        country: 'GB'
      )
    end

    it 'should create a valid request object', skip: using_demo_key? do
      actual = signer.sign(subject.build_request(trackid: 1234, formatid: 26, country: 'GB'))

      res = Faraday.get(actual)

      expect(res.status).to eq(200)
      expect(res.headers['Content-Type']).to eq('audio/mpeg')
    end
  end
end
