require 'spec_helper'
require 'endpoints/track_details'

module SevenDigital
  module Endpoints
    RSpec.describe 'TrackDetails' do
      describe '#generate_url' do
        it 'should return a signed url' do
          subject = TrackDetails.new('foo')

          expect(subject.generate_url(1234)).to eq('https://api.7digital.com/1.2/track/details?trackId=1234&oauth_consumer_key=foo')
        end
      end
    end
  end
end
