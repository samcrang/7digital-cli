require 'spec_helper'

describe ::SevenDigital::CLI::App do
  let(:factory) { double('endpoint_factory') }
  let(:signature_generator) { double('signature_generator') }
  subject { ::SevenDigital::CLI::App.new(factory) }

  context 'sign' do
    context 'track/details' do
      describe '#run' do
        before(:each) do
          allow(factory).to receive(:find).with('track/details').and_return(signature_generator)
        end

        it 'should pass the correct arguments to the endpoint handler' do
          expect(signature_generator).to receive(:generate_url).with(1234)

          subject.run(%w(sign track/details --trackid=1234))
        end

        it 'should not allow someone to specify a non-integer track id' do
          expect { subject.run(%w(sign track/details --trackid=invalid)) }.to raise_error(SystemExit)
        end

        it 'should require a track id' do
          expect { subject.run(%w(sign track/details)) }.to raise_error(SystemExit)
        end
      end
    end

    context 'release/details' do
      describe '#run' do
        before(:each) do
          allow(factory).to receive(:find).with('release/details').and_return(signature_generator)
        end

        it 'should pass the correct arguments to the endpoint handler' do
          expect(signature_generator).to receive(:generate_url).with(1234)

          subject.run(%w(sign release/details --releaseid=1234))
        end

        it 'should not allow someone to specify a non-integer release id' do
          expect { subject.run(%w(sign release/details --releaseid=invalid)) }.to raise_error(SystemExit)
        end

        it 'should require a release id' do
          expect { subject.run(%w(sign release/details)) }.to raise_error(SystemExit)
        end
      end
    end

    context 'clip' do
      describe '#run' do
        before(:each) do
          allow(factory).to receive(:find).with('clip').and_return(signature_generator)
        end

        it 'should pass the correct arguments to the endpoint handler' do
          expect(signature_generator).to receive(:generate_url).with(1234, 'GB')

          subject.run(%w(sign clip --trackid=1234))
        end

        it 'should allow country to be overridden' do
          expect(signature_generator).to receive(:generate_url).with(1234, 'US')

          subject.run(%w(sign clip --trackid=1234 --country=US))
        end

        it 'should not allow someone to specify a non-integer track id' do
          expect { subject.run(%w(sign clip --trackid=invalid)) }.to raise_error(SystemExit)
        end

        it 'should require a track id' do
          expect { subject.run(%w(sign clip)) }.to raise_error(SystemExit)
        end
      end
    end

    context 'stream/subscription' do
      describe '#run' do
        before(:each) do
          allow(factory).to receive(:find).with('stream/subscription').and_return(signature_generator)
        end

        it 'should pass the correct arguments to the endpoint handler' do
          expect(signature_generator).to receive(:generate_url).with(1234, 26, 'GB')

          subject.run(%w(sign stream/subscription --trackid=1234))
        end

        it 'should allow country to be overridden' do
          expect(signature_generator).to receive(:generate_url).with(1234, 26, 'US')

          subject.run(%w(sign stream/subscription --trackid=1234 --country=US))
        end

        it 'should allow format id to be overridden' do
          expect(signature_generator).to receive(:generate_url).with(1234, 55, 'GB')

          subject.run(%w(sign stream/subscription --trackid=1234 --formatid=55))
        end

        it 'should not allow someone to specify a non-integer format id' do
          expect { subject.run(%w(sign stream/subscription --trackid=1234 --formatid=invalid)) }.to raise_error(SystemExit)
        end

        it 'should not allow someone to specify a non-integer track id' do
          expect { subject.run(%w(sign stream/subscription --trackid=invalid)) }.to raise_error(SystemExit)
        end

        it 'should require a track id' do
          expect { subject.run(%w(sign stream/subscription)) }.to raise_error(SystemExit)
        end
      end
    end

    context 'stream/catalogue' do
      describe '#run' do
        before(:each) do
          allow(factory).to receive(:find).with('stream/catalogue').and_return(signature_generator)
        end

        it 'should pass the correct arguments to the endpoint handler' do
          expect(signature_generator).to receive(:generate_url).with(1234, 26, 'GB')

          subject.run(%w(sign stream/catalogue --trackid=1234))
        end

        it 'should allow country to be overridden' do
          expect(signature_generator).to receive(:generate_url).with(1234, 26, 'US')

          subject.run(%w(sign stream/catalogue --trackid=1234 --country=US))
        end

        it 'should allow format id to be overridden' do
          expect(signature_generator).to receive(:generate_url).with(1234, 55, 'GB')

          subject.run(%w(sign stream/catalogue --trackid=1234 --formatid=55))
        end

        it 'should not allow someone to specify a non-integer format id' do
          expect { subject.run(%w(sign stream/catalogue --trackid=1234 --formatid=invalid)) }.to raise_error(SystemExit)
        end

        it 'should not allow someone to specify a non-integer track id' do
          expect { subject.run(%w(sign stream/catalogue --trackid=invalid)) }.to raise_error(SystemExit)
        end

        it 'should require a track id' do
          expect { subject.run(%w(sign stream/catalogue)) }.to raise_error(SystemExit)
        end
      end
    end
  end
end
