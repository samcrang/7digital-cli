require 'spec_helper'

describe '#generate_url' do
  subject { ::SevenDigital::Endpoints::StreamSubscription.new('foo', 'bar', 'baz', 'qux') }

  it 'should return a signed url' do
    actual = subject.generate_url(1234)

    expect(actual).to start_with('https://stream.svc.7digital.net/stream/subscription')
    expect(actual).to include('trackid=1234')
    expect(actual).to include('oauth_consumer_key=foo')
    expect(actual).to include('oauth_token=baz')
    expect(actual).to include('oauth_signature=')
  end
end
