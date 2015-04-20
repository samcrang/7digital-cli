require 'spec_helper'

describe ::SevenDigital::Signer do
  subject { ::SevenDigital::Signer.new 'consumer_key', 'consumer_secret', 'token_key', 'token_secret' }

  it 'should add the consumer key for requests that require it' do
    actual = subject.sign(
      uri: 'http://api.7digital.com/1.2/track/details',
      parameters: { trackid: 1234 },
      protection: :requires_consumer_key
    )

    expect(actual).to eq('http://api.7digital.com/1.2/track/details?oauth_consumer_key=consumer_key&trackid=1234')
  end

  it 'should sign requests that require it' do
    actual = subject.sign(
      uri: 'http://api.7digital.com/1.2/track/details',
      parameters: { trackid: 1234 },
      protection: :requires_signing
    )

    expect(actual).to include('http://api.7digital.com/1.2/track/details')
    expect(actual).to include('oauth_consumer_key=consumer_key')
    expect(actual).to include('oauth_signature=')
  end

  it 'should sign with a user for requests that require it' do
    actual = subject.sign(
      uri: 'http://api.7digital.com/1.2/track/details',
      parameters: { trackid: 1234 },
      protection: :requires_signing_with_user
    )

    expect(actual).to include('http://api.7digital.com/1.2/track/details')
    expect(actual).to include('oauth_consumer_key=consumer_key')
    expect(actual).to include('oauth_token=token_key')
    expect(actual).to include('oauth_signature=')
  end

  it 'should raise an error if there is an unknown protection type' do
    expect { subject.sign(protection: :unknown) }.to raise_error(ArgumentError)
  end
end
