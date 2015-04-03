require 'spec_helper'
require 'endpoints/release_details'

module SevenDigital
  module Endpoints
    RSpec.describe 'ReleaseDetails' do
      describe '#generate_url' do
        it 'should return a signed url' do
          subject = ReleaseDetails.new('foo')

          expect(subject.generate_url(1234)).to eq('https://api.7digital.com/1.2/release/details?releaseId=1234&oauth_consumer_key=foo')
        end
      end
    end
  end
end
