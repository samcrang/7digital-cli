require 'spec_helper'

describe ::SevenDigital::Endpoints::StreamCatalogue do
  subject { ::SevenDigital::Endpoints::StreamCatalogue.new('foo', 'bar') }

  context 'with dummy authorization configuration' do
    describe '#generate_url' do
      it 'should return a signed url' do
        actual = subject.generate_url(1234)

        expect(actual).to start_with('https://stream.svc.7digital.net/stream/catalogue')
        expect(actual).to include('oauth_signature=')
        expect(actual).to include('oauth_consumer_key=foo')
        expect(actual).to include('trackid=1234')
      end
    end
  end

  context 'with real authorization configuration', skip: using_demo_key? do
    subject { ::SevenDigital::Endpoints::StreamCatalogue.new(ENV['SEVENDIGITAL_CONSUMER_KEY'], ENV['SEVENDIGITAL_CONSUMER_SECRET']) }

    describe '#generate_url' do
      it 'should return a signed url' do
        res = Faraday.get(subject.generate_url(1234))

        expect(res.status).to eq(200)
        expect(res.headers['Content-Type']).to eq('audio/mpeg')
      end
    end
  end
end
