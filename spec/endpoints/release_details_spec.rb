require 'spec_helper'

describe ::SevenDigital::Endpoints::ReleaseDetails do
  context 'with dummy authorization configuration' do
    subject { ::SevenDigital::Endpoints::ReleaseDetails.new('foo') }

    describe '#generate_url' do
      it 'should return a signed url' do
        expect(subject.generate_url(1234)).to eq('https://api.7digital.com/1.2/release/details?oauth_consumer_key=foo&releaseid=1234')
      end
    end
  end

  context 'with real authorization configuration' do
    subject { ::SevenDigital::Endpoints::ReleaseDetails.new(ENV['SEVENDIGITAL_CONSUMER_KEY']) }

    describe '#generate_url' do
      it 'should be requestable' do
        res = Faraday.get(subject.generate_url(2345))

        expect(res.status).to eq(200)
        expect(res.headers['Content-Type']).to eq('application/xml; charset=utf-8')
        expect(res.body).to include('Sound Affects')
      end
    end
  end
end