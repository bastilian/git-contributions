require 'rails_helper'

RSpec.describe 'repositories/show', type: :view do
  before(:each) do
    @repository = assign(:repository, FactoryGirl.create(:repository))
  end

  it 'renders attributes in <p>' do
    render
  end
end
