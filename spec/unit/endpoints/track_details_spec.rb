require 'spec_helper'
require '7d/endpoints/track_details'

module SevenDigital
  module Endpoints
    RSpec.describe 'TrackDetails' do
      describe '#generate_url' do
        it 'should return a signed url' do
          subject = TrackDetails.new('foo')

          expect(subject.generate_url(track_id: 1234)).to eq('https://api.7digital.com/1.2/track/details?oauth_consumer_key=foo&trackid=1234')
        end
      end
    end
  end
end
