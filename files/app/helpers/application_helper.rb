module ApplicationHelper
  def full_title(page_title = nil)
    base_title = "さくら商会"
    base_title << "【開発】" if Rails.env.development?
    page_title.nil? ? base_title : "#{page_title} | #{base_title}"
  end
end
