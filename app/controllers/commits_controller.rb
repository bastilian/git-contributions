class CommitsController < ApplicationController
  before_action :set_repository

  # GET /repositories/repository_id/commits
  # GET /repositories/repository_id/commits.json
  def index
    @commits = @repository.commits.all
  end

  # GET /repositories/repository_id/commits/1
  # GET /repositories/repository_id/commits/1.json
  def show
    @commit = @repository.commits.find(params[:id])
  end

  private

  def set_repository
    @repository = Repository.find(params[:repository_id])
  end
end
