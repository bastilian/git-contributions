require 'rails_helper'

RSpec.describe Repository, type: :model do
  subject { FactoryGirl.create(:repository) }

  expect_it { to validate_presence_of :url }
  expect_it { to have_many(:commits).dependent(:destroy) }
  expect_it { to have_many(:authors) }

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
