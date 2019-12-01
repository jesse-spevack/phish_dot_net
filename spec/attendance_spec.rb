require 'spec_helper'

RSpec.describe Attendance do
  # let(:response) { JSON.parse('{"artistid":1,"name":"Phish","link":"http:\/\/phish.net\/setlists\/phish"}') }
  # subject { described_class.new(response) }

  describe '#profile' do
    it 'returns the user profile url' do
      # expect(subject.name).to eq 'Phish'
    end
  end

  describe '#user_id' do
    it 'returns the user id' do
      # expect(subject.link).to eq 'http://phish.net/setlists/phish'
    end
  end

  describe '#username' do
    it 'returns the user name' do
      # expect(subject.id).to eq 1
    end
  end

  describe '.all', :vcr do
    context 'without any parameters' do
      subject { described_class.all }

      it 'returns the correct number of attendances' do
        expect(subject.count).to eq 1
      end

      it 'returns an array of attendances' do
        subject.each { |attendance| expect(attendance).to be_a described_class }
      end
    end

    context 'with show id parameters' do
      subject { described_class.all(show_id: 1) }

      it 'returns the correct number of attendances' do
        # expect(subject.count).to eq 1048
      end

      it 'returns an array of attendances' do
        # subject.each { |attendance| expect(attendance).to be_a described_class }
      end
    end

    context 'with show date parameters' do
      subject { described_class.all(show_date: 1) }

      it 'returns the correct number of attendances' do
        # expect(subject.count).to eq 1048
      end

      it 'returns an array of attendances' do
        # subject.each { |attendance| expect(attendance).to be_a described_class }
      end
    end
  end
end
