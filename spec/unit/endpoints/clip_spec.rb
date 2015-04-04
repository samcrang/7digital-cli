require 'spec_helper'

describe 'Clip' do
  subject { ::SevenDigital::Endpoints::Clip.new('foo', 'bar') }

  describe '#generate_url' do
    it 'should return a signed url' do
      actual = subject.generate_url(track_id: 1234, country: 'GB')

      expect(actual).to start_with('https://previews.7digital.com/clip/1234')
      expect(actual).to include('country=GB')
      expect(actual).to include('trackid=1234')
      expect(actual).to include('oauth_signature=')
      expect(actual).to include('oauth_consumer_key=foo')
    end
  end
end
