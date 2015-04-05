require 'spec_helper'

describe ::SevenDigital::Endpoints::StreamSubscription do
  context 'with dummy authorization configuration' do
    describe '#generate_url' do
      subject { ::SevenDigital::Endpoints::StreamSubscription.new('foo', 'bar', 'baz', 'qux') }

      it 'should return a signed url' do
        actual = subject.generate_url(1234, 26, 'GB')

        expect(actual).to start_with('https://stream.svc.7digital.net/stream/subscription')
        expect(actual).to include('trackid=1234')
        expect(actual).to include('formatid=26')
        expect(actual).to include('country=GB')
        expect(actual).to include('oauth_consumer_key=foo')
        expect(actual).to include('oauth_token=baz')
        expect(actual).to include('oauth_signature=')
      end
    end
  end

  context 'with real authorization configuration', skip: using_demo_key? do
    subject do
      ::SevenDigital::Endpoints::StreamSubscription.new(
        ENV['SEVENDIGITAL_CONSUMER_KEY'],
        ENV['SEVENDIGITAL_CONSUMER_SECRET'],
        ENV['SEVENDIGITAL_TOKEN'],
        ENV['SEVENDIGITAL_TOKEN_SECRET']
      )
    end

    describe '#generate_url' do
      it 'should be requestable' do
        res = Faraday.get(subject.generate_url(1234, 26, 'GB'))

        expect(res.status).to eq(200)
        expect(res.headers['Content-Type']).to eq('audio/mpeg')
      end
    end
  end
end
