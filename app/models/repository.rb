# Repository Model that holds all the commits
class Repository < ActiveRecord::Base
  validates_presence_of :url
  validates :url, url: true

  has_many :commits, dependent: :destroy
  has_many :authors, through: :commits

  before_validation :set_name_and_organization_from_url

  after_create do
    RepositoryImportJob.perform_later(self)
  end

  after_destroy :remove_clone

  # Clones a repository from a git url/path
  def clone
    cloned? ? local : Git.clone(url, local_path)
  end

  # Returns wether or not the repository is already cloned
  def cloned?
    File.directory?(local_path)
  end

  # Opens the local repository clone and returns a Git::Base
  def local
    @local ||= Git.open(local_path)
  end

  # Returns a path composed of storage path, organization and name
  def local_path
    "#{ENV['STORAGE']}/#{organization}/#{name}/"
  end

  # Imports commits from log entries
  def import
    local.log(nil).each do |commit|
      next if Commit.where(sha: commit.sha).first
      commit = commits.create_from_git_commit(commit)
      commit.save!
    end
  end

  def set_name_and_organization_from_url
    self.organization, self.name = (url || '').scan(/^https?:\/\/github\.com\/([\w-]*)\/+([\w-]*)/).flatten
  end

  def remove_clone
    FileUtils.rmdir(local_path)
  end
end
