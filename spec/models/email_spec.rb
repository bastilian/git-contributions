require 'rails_helper'

RSpec.describe Email, type: :model do
  expect_it { to belong_to :author }
  expect_it { to validate_presence_of :address }
end
