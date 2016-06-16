# Commit in a repository, by an author
class Commit < ActiveRecord::Base
  belongs_to :author
  belongs_to :repository

  validates_presence_of :author
  validates_presence_of :repository
  validates_presence_of :committed_at

  accepts_nested_attributes_for :author
end
