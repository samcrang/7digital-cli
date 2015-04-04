require 'spec_helper'

describe 'ReleaseDetails' do
  subject { ::SevenDigital::Endpoints::ReleaseDetails.new('foo') }

  describe '#generate_url' do
    it 'should return a signed url' do
      expect(subject.generate_url(release_id: 1234)).to eq('https://api.7digital.com/1.2/release/details?oauth_consumer_key=foo&releaseid=1234')
    end
  end
end
