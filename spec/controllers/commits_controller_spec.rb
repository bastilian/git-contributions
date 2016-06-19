require 'rails_helper'

RSpec.describe CommitsController, type: :controller do
  let(:repository) { FactoryGirl.create(:repository) }

  before do
    repository.save!
    repository.import
  end

  describe 'GET #index' do
    it 'assigns all repositories as @repositories' do
      get :index, repository_id: repository.to_param
      expect(assigns(:repository)).to eq(repository)
      expect(assigns(:commits)).to eq(repository.commits.all)
    end
  end

  describe 'GET #show' do
    let(:last_commit) { repository.commits.last }

    it 'assigns the requested repository as @repository' do
      get :show, repository_id: repository.to_param, id: last_commit.to_param
      expect(assigns(:repository)).to eq(repository)
      expect(assigns(:commit)).to eq(last_commit)
    end
  end
end