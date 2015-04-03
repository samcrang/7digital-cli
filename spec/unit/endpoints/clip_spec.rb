require 'spec_helper'
require 'endpoints/clip'

module SevenDigital
  module Endpoints
    RSpec.describe 'Clip' do
      describe '#generate_url' do
        it 'should return a signed url' do
          subject = Clip.new('foo', 'bar')
          actual = subject.generate_url(1234)

          expect(actual).to start_with('https://previews.7digital.com/clip/1234')
          expect(actual).to include('&oauth_signature=')
        end
      end
    end
  end
end
