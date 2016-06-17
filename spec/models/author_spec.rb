require 'rails_helper'

RSpec.describe Author, type: :model do
  expect_it { to validate_presence_of :name }

  expect_it { to have_many(:emails).dependent(:destroy) }
  expect_it { to have_many :commits }
  expect_it { to have_many :repositories }

  describe '.with_email' do
    let(:author) { FactoryGirl.create(:email).author }

    it 'returns an author having the matching email' do
      expect(Author.with_email(author.emails.first.address).first).to eq(author)
    end
  end
end
