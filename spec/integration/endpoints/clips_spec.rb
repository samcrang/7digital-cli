require 'spec_helper'

describe 'Clip' do
  subject { ::SevenDigital::Endpoints::Clip.new(ENV['SEVENDIGITAL_CONSUMER_KEY'], ENV['SEVENDIGITAL_CONSUMER_SECRET']) }

  describe '#generate_url' do
    it 'should return a signed URI that can be successfully invoked' do
      uri = URI(subject.generate_url(track_id: 1234, country: 'GB'))

      res = Net::HTTP.get_response(uri)

      expect(res.code).to eq('200')
      expect(res.content_type).to eq('audio/mpeg')
    end
  end
end
