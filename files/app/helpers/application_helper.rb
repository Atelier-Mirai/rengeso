module ApplicationHelper
  def full_title(page_title = nil)
    base_title = "株式会社蓮華草"
    base_title = "【開発】#{base_title}" if Rails.env.development?
    page_title.blank? ? base_title : "#{page_title} | #{base_title}"
  end
end
