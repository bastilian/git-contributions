class Repository < ActiveRecord::Base
  validates_presence_of :url

  def clone
    system("git clone #{url} /tmp/repositories/#{id}")
  end

  def log
    raw_log.each_line.map do |raw_commit|
      commit = raw_commit.split('|')
      {
        committed_at: commit[0],
        author: {
          name: commit[1],
          email: commit[2]
        }
      }
    end
  end

  def raw_log
    `cd /tmp/repositories/#{id} && git log --pretty="%cd|%aN|%ae|%s"`
  end
end
