require 'rails_helper'

RSpec.describe Repository, type: :model do
  subject { FactoryGirl.create(:repository) }

  expect_it { to validate_presence_of :url }

  describe "#clone" do
    it "clones the repository via system" do
      expect(subject).to receive(:system).with("git clone #{subject.url} /tmp/repositories/#{subject.id}").and_call_original
      subject.clone
    end
  end

  describe "#log" do
    it "returns an array" do
      expect(subject.log.class).to eq(Array)
    end

    it "contains a Hash for each commit" do
      expect(subject.log.first.class).to eq(Hash)
    end

    it "contains a committed_at date and author with email and name" do
      expect(subject.log.first[:committed_at].class).to eq(DateTime)
      expect(subject.log.first[:author]).to_not be_nil
      expect(subject.log.first[:author][:email]).to_not be_nil
      expect(subject.log.first[:author][:name]).to_not be_nil
    end
  end
end
