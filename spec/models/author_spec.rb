require 'rails_helper'

RSpec.describe Author, type: :model do
  expect_it { to validate_presence_of :name }

  expect_it { to have_many :emails }
  expect_it { to have_many :commits }
  expect_it { to have_many :repositories }
end
