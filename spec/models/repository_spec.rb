require 'rails_helper'

RSpec.describe Repository, type: :model do
  subject { FactoryGirl.create(:repository) }

  expect_it { to validate_presence_of :url }

  expect_it { to have_many(:commits).dependent(:destroy) }
  expect_it { to have_many(:authors) }

  describe '#local_path' do
    it 'returns a path for the repository' do
      expect(subject.local_path).to eq("#{ENV['STORAGE']}/#{subject.organization}/#{subject.name}/")
    end
  end

  describe '#clone' do
    it 'clones the repository via system' do
      expect(subject).to receive(:cloned?).and_return(false)
      expect(Git).to receive(:clone).with(subject.url, subject.local_path).and_return(true)

      subject.clone
    end
  end

  describe '#local' do
    it 'opens the local repo and returns Git::Base' do
      expect(subject.local.class).to eq(Git::Base)
    end

    it 'returns false if local init fails' do
      expect(subject).to receive(:local_path).at_least(1).and_return('/dev/null')
      expect(subject.local).to eq(false)
    end
  end

  describe '#import' do
    it 'creates commits for each entry in #log' do
      expect do
        subject.import
      end.to change(Commit, :count).by(subject.local.log(nil).size)
    end

    it 'does not import commits twice' do
      subject.import

      expect do
        subject.import
      end.not_to change(Commit, :count)
    end
  end
end
