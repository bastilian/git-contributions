# An author of commits
class Author < ActiveRecord::Base
  validates_presence_of :name

  has_many :emails
  has_many :commits
  has_many :repositories, through: :commits

  accepts_nested_attributes_for :emails

  scope :with_email, -> (address) do
    joins(:emails).where('emails.address = ?', address)
  end
end
