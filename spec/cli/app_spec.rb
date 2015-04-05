require 'spec_helper'

describe ::SevenDigital::CLI::App do
  context 'sign' do
    context 'track/details' do
      describe '#run' do
        it 'should pass the correct arguments to the endpoint handler' do
          factory = double('endpoint_factory')
          signature_generator = double('signature_generator')
          subject = ::SevenDigital::CLI::App.new(factory)

          expect(factory).to receive(:find).with('track/details').and_return(signature_generator)
          expect(signature_generator).to receive(:generate_url).with('1234')

          subject.run(%w(sign track/details --trackid=1234))
        end
      end
    end

    context 'clip' do
      describe '#run' do
        it 'should pass the correct arguments to the endpoint handler' do
          factory = double('endpoint_factory')
          signature_generator = double('signature_generator')
          subject = ::SevenDigital::CLI::App.new(factory)

          expect(factory).to receive(:find).with('clip').and_return(signature_generator)
          expect(signature_generator).to receive(:generate_url).with('1234', 'GB')

          subject.run(%w(sign clip --trackid=1234))
        end
      end
    end

    context 'release/details' do
      describe '#run' do
        it 'should pass the correct arguments to the endpoint handler' do
          factory = double('endpoint_factory')
          signature_generator = double('signature_generator')
          subject = ::SevenDigital::CLI::App.new(factory)

          expect(factory).to receive(:find).with('release/details').and_return(signature_generator)
          expect(signature_generator).to receive(:generate_url).with('1234')

          subject.run(%w(sign release/details --releaseid=1234))
        end
      end
    end

    context 'stream/catalgoue' do
      describe '#run' do
        it 'should pass the correct arguments to the endpoint handler' do
          factory = double('endpoint_factory')
          signature_generator = double('signature_generator')
          subject = ::SevenDigital::CLI::App.new(factory)

          expect(factory).to receive(:find).with('stream/catalogue').and_return(signature_generator)
          expect(signature_generator).to receive(:generate_url).with('1234')

          subject.run(%w(sign stream/catalogue --trackid=1234))
        end
      end
    end

    context 'stream/subscription' do
      describe '#run' do
        it 'should pass the correct arguments to the endpoint handler' do
          factory = double('endpoint_factory')
          signature_generator = double('signature_generator')
          subject = ::SevenDigital::CLI::App.new(factory)

          expect(factory).to receive(:find).with('stream/subscription').and_return(signature_generator)
          expect(signature_generator).to receive(:generate_url).with('1234')

          subject.run(%w(sign stream/subscription --trackid=1234))
        end
      end
    end
  end
end
