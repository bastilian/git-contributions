class Email < ActiveRecord::Base
  belongs_to :author

  validates_presence_of :address
end
