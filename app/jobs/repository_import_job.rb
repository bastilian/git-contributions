class RepositoryImportJob < ActiveJob::Base
  queue_as :default

  def perform(repository)
    repository.clone
    repository.import
  end
end
