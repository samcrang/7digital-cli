require 'spec_helper'

describe 'bin/7d' do
  it 'should be able to generate a URI for track/details' do
    expect(`bin/7d sign track/details --trackid=1234`).to start_with('https')
  end

  it 'should be able to generate a URI for release/details' do
    expect(`bin/7d sign release/details --releaseid=12345`).to start_with('https')
  end

  it 'should be able to able to generate a preview clip' do
    expect(`bin/7d sign clip --trackid=1234`).to start_with('https')
  end

  it 'should be able to generate a URI for stream/catalogue' do
    expect(`bin/7d sign stream/catalogue --trackid=1234`).to start_with('https')
  end

  it 'should be able to generate a URI for stream/subscription' do
    expect(`bin/7d sign stream/subscription --trackid=1234`).to start_with('https')
  end
end
