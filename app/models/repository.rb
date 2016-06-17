# Repository Model that holds all the commits
class Repository < ActiveRecord::Base
  validates_presence_of :url

  has_many :commits, dependent: :destroy

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
    log.each do |commit|
      commit = commits.create(commit)
      author = Author.with_email(commit.author.emails.first.address).first
      commit.author = author if author
      commit.save!
    end
  end

  # Returns an array of commit log entries from a raw git log
  def log
    local.log.map do |commit|
      {
        committed_at: commit.date.to_datetime,
        author_attributes: {
          name: commit.author.name,
          emails_attributes: [
            address: commit.author.email
          ]
        }
      }
    end
  end
end
