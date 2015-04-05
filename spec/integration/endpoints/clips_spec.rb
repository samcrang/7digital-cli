require 'spec_helper'

describe 'Clip' do
  subject { ::SevenDigital::Endpoints::Clip.new(ENV['SEVENDIGITAL_CONSUMER_KEY'], ENV['SEVENDIGITAL_CONSUMER_SECRET']) }

  describe '#generate_url' do
    it 'should return a signed URI that can be successfully invoked' do
      res = Faraday.get(subject.generate_url(1234, 'GB'))

      expect(res.status).to eq(200)
      expect(res.headers['Content-Type']).to eq('audio/mpeg')
    end
  end
end
