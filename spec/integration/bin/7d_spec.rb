require 'spec_helper'
require 'open3'
require 'open-uri'

def valid_environment?
  !ENV['SEVENDIGITAL_CONSUMER_KEY'].nil? && !ENV['SEVENDIGITAL_CONSUMER_SECRET'].nil?
end

module SevenDigital
  RSpec.describe 'bin/7d' do
    context 'with an incorrectly configured environment' do
      it 'should fail with error message' do
        skip 'TODO'
      end
    end

    context 'with correctly configured environment', skip: !valid_environment? do
      it 'should invoke thor' do
        _, stdout, _ = Open3.popen3('bin/7d')

        expect(stdout.gets).to match(/Commands/)
      end

      it 'should be able to fetch track/details' do
        _, stdout, _ = Open3.popen3('bin/7d sign track_details 1234')

        uri = stdout.gets

        open(uri) do |r|
          expect(r.status[0]).to eq('200')
          expect(r.read).to match(/Everyday Struggle/)
        end
      end

      it 'should be able to fetch release/details' do
        _, stdout, _ = Open3.popen3('bin/7d sign release_details 12345')

        uri = stdout.gets

        open(uri) do |r|
          expect(r.status[0]).to eq('200')
          expect(r.read).to match(/Extremoduro/)
        end
      end

      it 'should be able to fetch a preview clip' do
        _, stdout, _ = Open3.popen3('bin/7d sign clip 1234')

        uri = stdout.gets

        open(uri) do |r|
          expect(r.status[0]).to eq('200')
        end
      end

      it 'should be able to fetch stream/catalogue' do
        _, stdout, _ = Open3.popen3('bin/7d sign stream_catalogue 1234')

        uri = stdout.gets

        open(uri) do |r|
          expect(r.status[0]).to eq('200')
        end
      end

      it 'should be able to fetch stream/subscription' do
        _, stdout, _ = Open3.popen3('bin/7d sign stream_subscription 1234')

        uri = stdout.gets

        open(uri) do |r|
          expect(r.status[0]).to eq('200')
        end
      end
    end
  end
end
