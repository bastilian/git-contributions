require 'rails_helper'

RSpec.describe Repository, type: :model do
  subject { FactoryGirl.create(:repository) }

  expect_it { to validate_presence_of :url }

  describe "#clone" do
    it "clones the repository via system" do
      expect(subject).to receive(:system).with("git clone #{subject.url} ./tmp/repositories/#{subject.id}")
      subject.clone
    end
  end
end
