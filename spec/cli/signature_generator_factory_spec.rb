require 'spec_helper'

describe ::SevenDigital::CLI::SignatureGeneratorFactory do
  subject { ::SevenDigital::CLI::SignatureGeneratorFactory.new }

  describe '#find' do
    it 'should return TrackDetails' do
      expect(subject.find('track/details')).to be_an_instance_of(::SevenDigital::Endpoints::TrackDetails)
    end

    it 'should return Clip' do
      expect(subject.find('clip')).to be_an_instance_of(::SevenDigital::Endpoints::Clip)
    end

    it 'should return ReleaseDetails' do
      expect(subject.find('release/details')).to be_an_instance_of(::SevenDigital::Endpoints::ReleaseDetails)
    end

    it 'should return StreamCatalogue' do
      expect(subject.find('stream/catalogue')).to be_an_instance_of(::SevenDigital::Endpoints::StreamCatalogue)
    end

    it 'should return StreamSubscription' do
      expect(subject.find('stream/subscription')).to be_an_instance_of(::SevenDigital::Endpoints::StreamSubscription)
    end
  end
end
