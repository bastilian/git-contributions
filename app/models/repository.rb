# Repository Model that holds all the commits
class Repository < ActiveRecord::Base
  validates_presence_of :url

  has_many :commits

  # Clones a repository from a git url/path
  def clone
    system("git clone #{url} /tmp/repositories/#{id}")
  end

  # Imports commits from log entries
  def import
    log.each do |commit|
      commits.create(commit)
    end
  end

  # Returns an array of commit log entries from a raw git log
  def log
    raw_log.each_line.map do |raw_commit|
      commit = raw_commit.split('|')
      {
        committed_at: DateTime.parse(commit[0]),
        author_attributes: {
          name: commit[1],
          emails_attributes: [
            address: commit[2]
          ]
        }
      }
    end
  end

  # Returns the git commit log as a String
  def raw_log
    `cd /tmp/repositories/#{id} && git log --pretty="%cd|%aN|%ae|%s"`
  end
end
