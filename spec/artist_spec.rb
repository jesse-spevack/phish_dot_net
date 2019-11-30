require 'spec_helper'

RSpec.describe Artist do
  let(:response) { JSON.parse('{"artistid":1,"name":"Phish","link":"http:\/\/phish.net\/setlists\/phish"}') }
  subject { described_class.new(response) }

  describe '#name' do
    it 'returns the artist name' do
      expect(subject.name).to eq 'Phish'
    end
  end

  describe '#link' do
    it 'returns the artist link' do
      expect(subject.link).to eq 'http://phish.net/setlists/phish'
    end
  end

  describe '#id' do
    it 'returns the artist id' do
      expect(subject.id).to eq 1
    end
  end

  describe '.all', :vcr do
    subject { described_class.all }

    it 'returns the correct number of artists' do
      expect(subject.count).to eq 5
    end

    it 'returns an array of artists' do
      subject.each { |artist| expect(artist).to be_a described_class }
    end

    it 'returns the correct names' do
      expect(subject.map(&:name)).to match_array ['Phish', 'Trey Anastasio', 'Mike Gordon', 'Jon Fishman', 'Page McConnell']
    end

    it 'returns the correct links' do
      expect(subject.map(&:link)).to match_array ['phish', 'trey', 'mike', 'fish', 'page'].map { |name| "http://phish.net/setlists/#{name}" }
    end

    it 'returns the correct ids' do
      expect(subject.map(&:id)).to match_array [1, 2, 6, 7, 9]
    end
  end
end
