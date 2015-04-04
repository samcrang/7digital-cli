require 'spec_helper'
require '7d/endpoints/clip'

module SevenDigital
  module Endpoints
    RSpec.describe 'Clip' do
      describe '#generate_url' do
        it 'should return a signed url' do
          subject = Clip.new('foo', 'bar')
          actual = subject.generate_url(track_id: 1234, country: 'GB')

          expect(actual).to start_with('https://previews.7digital.com/clip/1234')
          expect(actual).to include('oauth_signature=')
          expect(actual).to include('country=GB')
        end
      end
    end
  end
end
