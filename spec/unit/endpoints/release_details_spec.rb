require 'spec_helper'
require '7d/endpoints/release_details'

module SevenDigital
  module Endpoints
    RSpec.describe 'ReleaseDetails' do
      describe '#generate_url' do
        it 'should return a signed url' do
          subject = ReleaseDetails.new('foo')
          actual = subject.generate_url(release_id: 1234)

          expect(actual).to eq('https://api.7digital.com/1.2/release/details?oauth_consumer_key=foo&releaseid=1234')
        end
      end
    end
  end
end
