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
    subject { Commit.attributes_from_git_commit(log.first) }

    it 'contains a committed_at date and author with email and name' do
      expect(subject[:committed_at].class).to eq(DateTime)
      expect(subject[:deletions].class).to eq(Fixnum)
      expect(subject[:additions].class).to eq(Fixnum)
      expect(subject[:author_attributes]).to_not be_nil
      expect(subject[:author_attributes][:emails_attributes]).to_not be_nil
      expect(subject[:author_attributes][:name]).to_not be_nil
    end
  end

  describe '.create_from_git_commit' do
    let(:commit) { log.first }
    it 'gets attributes via attributes_from_git_commit' do
      expect(Commit).to receive(:attributes_from_git_commit).with(commit).and_call_original

      Commit.create_from_git_commit(commit)
    end
  end
end
