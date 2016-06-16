class Repository < ActiveRecord::Base
  validates_presence_of :url

  has_many :commits

  def clone
    system("git clone #{url} /tmp/repositories/#{id}")
  end

  def import
    log.each do |commit|
      commits.create(commit)
    end
  end

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

  def raw_log
    `cd /tmp/repositories/#{id} && git log --pretty="%cd|%aN|%ae|%s"`
  end
end
