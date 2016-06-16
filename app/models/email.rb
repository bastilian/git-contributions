# An Author can have multiple email addresses, so we store them in a seperate table
class Email < ActiveRecord::Base
  belongs_to :author

  validates_presence_of :address
end
