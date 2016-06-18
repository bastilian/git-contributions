require 'rails_helper'

RSpec.describe 'repositories/index', type: :view do
  before(:each) do
    assign(:repositories, [FactoryGirl.create(:repository)])
  end

  it 'renders a list of repositories' do
    render
  end
end
