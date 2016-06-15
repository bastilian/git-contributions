require 'rails_helper'

RSpec.describe Email, type: :model do
  expect_it { to belong_to :author }
end
