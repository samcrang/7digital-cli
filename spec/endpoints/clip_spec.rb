require 'spec_helper'

describe ::SevenDigital::Endpoints::Clip do
  subject { ::SevenDigital::Endpoints::Clip }
  let(:signer) { ::SevenDigital::Signer.new ENV['SEVENDIGITAL_CONSUMER_KEY'], ENV['SEVENDIGITAL_CONSUMER_SECRET'], '', '' }

  describe '.build_request' do
    it 'should create a request object' do
      actual = subject.build_request(trackid: 1234, country: 'GB')

      expect(actual[:uri]).to eq('https://previews.7digital.com/clip/1234')
    end

    it 'should create a valid request object' do
      actual = signer.sign(subject.build_request(trackid: 1234, country: 'GB'))
      res = Faraday.get(actual)
      expect(res.status).to eq(200)
      expect(res.headers['Content-Type']).to eq('audio/mpeg')
    end
  end
end
