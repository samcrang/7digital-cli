require 'spec_helper'
require 'endpoints/stream_catalogue'

module SevenDigital
  module Endpoints
    RSpec.describe 'StreamCatalogue' do
      describe '#generate_url' do
        it 'should return a signed url' do
          subject = StreamCatalogue.new('foo', 'bar')
          actual = subject.generate_url(track_id: 1234)

          expect(actual).to start_with('https://stream.svc.7digital.net/stream/catalogue')
          expect(actual).to include('trackid=1234')
          expect(actual).to include('&oauth_signature=')
        end
      end
    end
  end
end
