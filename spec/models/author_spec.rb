require 'rails_helper'

RSpec.describe Author, type: :model do
  expect_it { to validate_presence_of :name }
end
