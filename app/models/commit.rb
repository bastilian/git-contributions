# Commit in a repository, by an author
class Commit < ActiveRecord::Base
  belongs_to :author
  belongs_to :repository

  validates_presence_of :sha, :author, :repository, :committed_at
  validates_uniqueness_of :sha

  accepts_nested_attributes_for :author
end
