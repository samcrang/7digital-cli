require 'spec_helper'

describe 'StreamCatalogue' do
  subject { ::SevenDigital::Endpoints::StreamCatalogue.new('foo', 'bar') }

  describe '#generate_url' do
    it 'should return a signed url' do
      actual = subject.generate_url(track_id: 1234)

      expect(actual).to start_with('https://stream.svc.7digital.net/stream/catalogue')
      expect(actual).to include('oauth_signature=')
      expect(actual).to include('oauth_consumer_key=foo')
      expect(actual).to include('trackid=1234')
    end
  end
end
