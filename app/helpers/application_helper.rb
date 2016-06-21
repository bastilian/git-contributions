# Global view helpers
module ApplicationHelper
  def page_title
    title = 'Git Contributions'
    title += " - #{content_for :title}" if content_for(:title)

    title
  end
end
