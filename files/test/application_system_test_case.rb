require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]
  # include LoginHelper
end

# module LoginHelper
#   def login_as(user)
#     visit login_url
#     fill_in '電子メール', with: user.email
#     fill_in 'パスワード', with: 'pass'
#     click_on 'ログイン'
#   end
# end
