require 'spec_helper'

describe 'bin/7d' do
  context 'with correctly configured environment' do
    it 'should be able to fetch track/details' do
      expect(`bin/7d sign track_details 1234`).to start_with('https')
    end

    it 'should be able to generate a URI for release/details' do
      expect(`bin/7d sign release_details 12345`).to start_with('https')
    end

    it 'should be able to able to generate a preview clip' do
      expect(`bin/7d sign clip 1234`).to start_with('https')
    end

    it 'should be able to fetch stream/catalogue', skip: using_demo_key? do
      expect(`bin/7d sign stream_catalogue 1234`).to start_with('https')
    end

    it 'should be able to fetch stream/subscription', skip: using_demo_key? do
      expect(`bin/7d sign stream_subscription 1234`).to start_with('https')
    end
  end
end
