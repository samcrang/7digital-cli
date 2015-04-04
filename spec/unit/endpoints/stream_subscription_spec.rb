require 'spec_helper'
require '7d/endpoints/stream_subscription'

module SevenDigital
  module Endpoints
    RSpec.describe 'StreamSubscription' do
      describe '#generate_url' do
        it 'should return a signed url' do
          subject = StreamSubscription.new('foo', 'bar', 'baz', 'qux')
          actual = subject.generate_url(track_id: 1234)

          expect(actual).to start_with('https://stream.svc.7digital.net/stream/subscription')
          expect(actual).to include('trackid=1234')
          expect(actual).to include('oauth_token=baz')
          expect(actual).to include('&oauth_signature=')
        end
      end
    end
  end
end
