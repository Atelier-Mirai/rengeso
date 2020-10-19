require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:taro)

    login_user(user = @user)
  end

  test "利用者がログインできること" do
  end
end
