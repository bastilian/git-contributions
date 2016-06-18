require 'rails_helper'

RSpec.describe 'repositories/edit', type: :view do
  before(:each) do
    @repository = assign(:repository, FactoryGirl.create(:repository))
  end

  it 'renders the edit repository form' do
    render

    assert_select 'form[action=?][method=?]', repository_path(@repository), 'post' do
    end
  end
end
