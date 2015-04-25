require 'spec_helper'

describe ::SevenDigital::Endpoints::ReleaseDetails do
  subject { described_class }
  let(:signer) { ::SevenDigital::Signer.new ENV['SEVENDIGITAL_CONSUMER_KEY'], '', '', '' }

  describe '.build_request' do
    it 'should create a request object' do
      actual =  subject.build_request(releaseid: 1234, country: 'GB')

      expect(actual[:uri]).to eq('https://api.7digital.com/1.2/release/details')
      expect(actual[:parameters]).to eq(releaseid: 1234, country: 'GB')
    end

    it 'should create a valida request object' do
      actual = signer.sign(subject.build_request(releaseid: 2345, country: 'GB'))

      res = Faraday.get(actual)

      expect(res.status).to eq(200)
      expect(res.headers['Content-Type']).to eq('application/xml; charset=utf-8')
      expect(res.body).to include('Sound Affects')
    end
  end
end
