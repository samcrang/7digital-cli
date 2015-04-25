require 'spec_helper'

describe ::SevenDigital::Endpoint do
  context 'derived classes' do
    subject { Class.new described_class }

    describe '.parameters' do
      it 'should populate a collection of parameters' do
        subject.parameter :trackid, 'some description'
        subject.parameter :country, 'some description', default: true

        expect(subject.parameters).to eq(
          trackid: { description: 'some description', options: {} },
          country: { description: 'some description', options: { default: true } }
        )
      end
    end

    describe '.name' do
      it 'should be nil by default' do
        expect(subject.name).to eq(nil)
      end

      it 'should be overridable' do
        subject.name 'track/details'

        expect(subject.name).to eq('track/details')
      end
    end

    describe '.host' do
      it 'should have a sensible default' do
        expect(subject.host).to eq('api.7digital.com')
      end

      it 'should be overridable' do
        subject.host 'previews.7digital.com'

        expect(subject.host).to eq('previews.7digital.com')
      end
    end

    describe '.host' do
      it 'should be nil by default' do
        expect(subject.path).to eq(nil)
      end

      it 'should be overridable' do
        subject.path '/1.2/track/details'

        expect(subject.path).to eq('/1.2/track/details')
      end
    end

    describe '.protection' do
      it 'should be nil by default' do
        expect(subject.protection).to eq(nil)
      end

      it 'should be overridable' do
        subject.protection :requires_consumer_key

        expect(subject.protection).to eq(:requires_consumer_key)
      end
    end

    describe '.build_request' do
      it 'should return a request object' do
        subject.path '/path'
        subject.protection :require_consumer_key

        expect(subject.build_request {}).to eq(
          uri: 'https://api.7digital.com/path',
          parameters: {},
          protection: :require_consumer_key
        )
      end

      it 'should pass parameter values through' do
        subject.path '/path'
        subject.parameter :trackid, 'description'
        subject.protection :require_consumer_key

        expect(subject.build_request trackid: 1234).to eq(
          uri: 'https://api.7digital.com/path',
          parameters: { trackid: 1234 },
          protection: :require_consumer_key
        )
      end

      it 'should ignore unknown parameters' do
        subject.path '/path'
        subject.parameter :trackid, 'description'
        subject.protection :require_consumer_key

        expect(subject.build_request trackid: 1234, unknown: 'foo').to eq(
          uri: 'https://api.7digital.com/path',
          parameters: { trackid: 1234 },
          protection: :require_consumer_key
        )
      end

      it 'should ignore unknown parameters' do
        subject.path '/path'
        subject.parameter :trackid, 'description'
        subject.protection :require_consumer_key

        expect(subject.build_request trackid: 1234, unknown: 'foo').to eq(
          uri: 'https://api.7digital.com/path',
          parameters: { trackid: 1234 },
          protection: :require_consumer_key
        )
      end

      it 'should ensure required parameters are specified' do
        subject.path '/path'
        subject.parameter :trackid, 'description', required: true
        expect { subject.build_request({}) }.to raise_error(ArgumentError)
      end

      it 'should allow base uri to include parameters' do
        subject.path '/path/%<trackid>s'
        subject.parameter :trackid, 'description'

        actual = subject.build_request trackid: 1234

        expect(actual[:uri]).to eq('https://api.7digital.com/path/1234')
      end
    end
  end
end
