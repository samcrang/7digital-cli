require 'spec_helper'

describe ::SevenDigital::Endpoints::Clip do
  context 'with dummy authorization configuration' do
    subject { ::SevenDigital::Endpoints::Clip.new(ENV['SEVENDIGITAL_CONSUMER_KEY'], ENV['SEVENDIGITAL_CONSUMER_SECRET']) }

    describe '#generate_url' do
      it 'should return a signed url' do
        actual = subject.generate_url(1234, 'GB')

        expect(actual).to start_with('https://previews.7digital.com/clip/1234')
        expect(actual).to include('country=GB')
        expect(actual).to include('oauth_signature=')
        expect(actual).to include('oauth_consumer_key=')
      end
    end

    context 'with real authorization configuration' do
      describe '#generate_url' do
        it 'should be requestable' do
          res = Faraday.get(subject.generate_url(1234, 'GB'))

          expect(res.status).to eq(200)
          expect(res.headers['Content-Type']).to eq('audio/mpeg')
        end
      end
    end
  end
end
