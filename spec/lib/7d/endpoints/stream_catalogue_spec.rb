require 'spec_helper'

describe ::SevenDigital::Endpoints::StreamCatalogue do
  subject { ::SevenDigital::Endpoints::StreamCatalogue }
  let(:signer) { ::SevenDigital::Signer.new ENV['SEVENDIGITAL_CONSUMER_KEY'], ENV['SEVENDIGITAL_CONSUMER_SECRET'], '', '' }

  describe '.build_request' do
    it 'should create a request object' do
      actual = subject.build_request(trackid: 1234, country: 'GB', formatid: 26)

      expect(actual[:uri]).to eq('https://stream.svc.7digital.net/stream/catalogue')
      expect(actual[:parameters]).to eq(
        trackid: 1234,
        country: 'GB',
        formatid: 26
      )
    end

    it 'should create a valid request object', skip: using_demo_key? do
      actual = signer.sign(subject.build_request(trackid: 1234, country: 'GB', formatid: 26))

      res = Faraday.get(actual)

      expect(res.status).to eq(200)
      expect(res.headers['Content-Type']).to eq('audio/mpeg')
    end
  end
end
