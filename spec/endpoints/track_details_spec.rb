require 'spec_helper'

describe ::SevenDigital::Endpoints::TrackDetails do
  context 'with dummy authorization configuration' do
    subject { ::SevenDigital::Endpoints::TrackDetails.new('foo') }

    describe '#generate_url' do
      it 'should return a signed url' do
        expect(subject.generate_url(1234, 'GB')).to eq('https://api.7digital.com/1.2/track/details?oauth_consumer_key=foo&trackid=1234&country=GB')
      end
    end
  end

  context 'with real authorization configuration' do
    subject { ::SevenDigital::Endpoints::TrackDetails.new(ENV['SEVENDIGITAL_CONSUMER_KEY']) }

    describe '#generate_url' do
      it 'should requestable' do
        res = Faraday.get(subject.generate_url(1234, 'GB'))

        expect(res.status).to eq(200)
        expect(res.headers['Content-Type']).to eq('application/xml; charset=utf-8')
        expect(res.body).to include('Everyday Struggle')
      end
    end
  end
end
