require 'spec_helper'

describe 'TrackDetails' do
  subject { ::SevenDigital::Endpoints::TrackDetails.new('foo') }

  describe '#generate_url' do
    it 'should return a signed url' do
      expect(subject.generate_url(track_id: 1234)).to eq('https://api.7digital.com/1.2/track/details?oauth_consumer_key=foo&trackid=1234')
    end
  end
end
