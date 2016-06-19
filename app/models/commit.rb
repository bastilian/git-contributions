# Commit in a repository, by an author
class Commit < ActiveRecord::Base
  belongs_to :author
  belongs_to :repository

  validates_presence_of :sha, :author, :repository, :committed_at,
                        :deletions, :additions
  validates_uniqueness_of :sha

  accepts_nested_attributes_for :author

  class << self
    def attributes_from_git_commit(commit)
      {
        sha: commit.sha,
        committed_at: commit.date.to_datetime,
        deletions: commit.diff_parent.stats[:deletions].to_i,
        additions: commit.diff_parent.stats[:additions].to_i,
        author_attributes: {
          name: commit.author.name,
          emails_attributes: [
            address: commit.author.email
          ]
        }
      }
    end

    def create_from_git_commit(commit)
      commit = create(attributes_from_git_commit(commit))
      author = Author.with_email(commit.author.emails.first.address).first
      commit.author = author if author
      commit
    end
  end
end
