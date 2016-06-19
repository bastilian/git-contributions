# Repository Model that holds all the commits
class Repository < ActiveRecord::Base
  validates_presence_of :url

  has_many :commits, dependent: :destroy
  has_many :authors, through: :commits

  # Clones a repository from a git url/path
  def clone
    system("git clone #{url} /tmp/repositories/#{id}")
  end

  # Opens the local repository clone and returns a Git::Base
  def local
    @local ||= Git.open("/tmp/repositories/#{id}")
  end

  # Imports commits from log entries
  def import
    local.log(nil).each do |commit|
      next if Commit.where(sha: commit.sha).first
      commit = commits.create_from_git_commit(commit)
      commit.save!
    end
  end
end
