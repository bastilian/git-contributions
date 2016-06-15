class Repository < ActiveRecord::Base
  validates_presence_of :url

  def clone
    system("git clone #{url} ./tmp/repositories/#{id}")
  end
end
