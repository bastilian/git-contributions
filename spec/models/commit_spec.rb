require 'rails_helper'

RSpec.describe Commit, type: :model do
  expect_it { to validate_presence_of :author }
  expect_it { to validate_presence_of :repository }
  expect_it { to validate_presence_of :committed_at }
end
