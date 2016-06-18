require 'rails_helper'

RSpec.describe Repository, type: :model do
  subject { FactoryGirl.create(:repository) }

  expect_it { to validate_presence_of :url }
  expect_it { to have_many(:commits).dependent(:destroy) }

  describe '#clone' do
    it 'clones the repository via system' do
      expect(subject).to receive(:system)
        .with("git clone #{subject.url} /tmp/repositories/#{subject.id}").and_call_original

      subject.clone
    end
  end

  describe '#local' do
    it 'opens the local repo and returns Git::Base' do
      expect(subject.local.class).to eq(Git::Base)
    end
  end

  describe '#log' do
    it 'returns an array' do
      expect(subject.log.class).to eq(Array)
    end

    it 'contains a Hash for each commit' do
      expect(subject.log.first.class).to eq(Hash)
    end

    it 'contains a committed_at date and author with email and name' do
      expect(subject.log.first[:committed_at].class).to eq(DateTime)
      expect(subject.log.first[:author_attributes]).to_not be_nil
      expect(subject.log.first[:author_attributes][:emails_attributes]).to_not be_nil
      expect(subject.log.first[:author_attributes][:name]).to_not be_nil
    end
  end

  describe '#import' do
    it 'creates commits for each entry in #log' do
      expect do
        subject.import
      end.to change(Commit, :count).by(subject.log.length)
    end

    it 'does not import commits twice' do
      subject.import

      expect do
        subject.import
      end.not_to change(Commit, :count)
    end
  end
end
