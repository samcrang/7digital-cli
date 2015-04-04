require 'spec_helper'

describe 'StreamCatalogue' do
  subject { ::SevenDigital::Endpoints::StreamCatalogue.new(ENV['SEVENDIGITAL_CONSUMER_KEY'], ENV['SEVENDIGITAL_CONSUMER_SECRET']) }

  describe '#generate_url' do
    it 'should return a signed url', skip: using_demo_key? do
      uri = URI(subject.generate_url(track_id: 1234))

      res = Net::HTTP.get_response(uri)

      expect(res.code).to eq('200')
      expect(res.content_type).to eq('audio/mpeg')
    end
  end
end
