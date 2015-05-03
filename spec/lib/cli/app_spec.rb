require 'spec_helper'

describe ::SevenDigital::CLI::App do
  let(:signer) { spy(::SevenDigital::Signer) }

  subject { described_class.new(StringIO.new, StringIO.new, StringIO.new, Kernel, ENV, signer) }

  describe '.execute' do
    it 'should use the credentials stored in the environment by default' do
      subject.execute! %w(sign track/details --trackid=1234)

      expect(signer).to have_received(:new).with(ENV['SEVENDIGITAL_CONSUMER_KEY'], ENV['SEVENDIGITAL_CONSUMER_SECRET'], ENV['SEVENDIGITAL_TOKEN'], ENV['SEVENDIGITAL_TOKEN_SECRET'])
    end

    it 'should allow users to specify their own credentials' do
      subject.execute! %w(sign track/details --trackid=1234 --consumer-key=key --consumer-secret=consumer-secret --token=token --token-secret=token-secret)

      expect(signer).to have_received(:new).with('key', 'consumer-secret', 'token', 'token-secret')
    end
  end
end
