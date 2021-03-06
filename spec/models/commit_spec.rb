require 'rails_helper'

RSpec.describe Commit, type: :model do
  let(:repository) { FactoryGirl.create(:repository) }
  let(:log) { repository.local.log }

  expect_it { to validate_presence_of :sha }
  expect_it { to validate_presence_of :author }
  expect_it { to validate_presence_of :repository }
  expect_it { to validate_presence_of :committed_at }
  expect_it { to validate_uniqueness_of :sha }

  describe '.attributes_from_git_commit' do
    let(:log_entry) { log.to_a.sample }
    subject { Commit.attributes_from_git_commit(log_entry) }

    it 'contains a committed_at date and author with email and name' do
      expect(subject[:committed_at].class).to eq(DateTime)
      expect(subject[:deletions].class).to eq(Fixnum)
      expect(subject[:additions].class).to eq(Fixnum)
      expect(subject[:author_attributes]).to_not be_nil
      expect(subject[:author_attributes][:emails_attributes]).to_not be_nil
      expect(subject[:author_attributes][:name]).to_not be_nil
    end

    context 'when the commit date is empty' do
      it 'will take the parent date' do
        expect(log_entry).to receive(:date).and_return(nil)
        expect(subject[:committed_at].class).to eq(DateTime)
      end
    end
  end

  describe '.create_from_git_commit' do
    let(:commit) { log.to_a.sample }
    it 'gets attributes via attributes_from_git_commit' do
      expect(Commit).to receive(:attributes_from_git_commit).with(commit).and_call_original

      Commit.create_from_git_commit(commit)
    end
  end
end
