require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:taro)
  end

  test "パスワードが正しいと、ログインできる" do
    visit login_url
    fill_in 'メールアドレス', with: @user.email
    fill_in 'パスワード', with: 'password'
    click_on 'ログインする'

    assert_selector ".ui.success.message", text: "ログインしました"
  end

  test "パスワードが違うと、ログインできない" do
    visit login_url
    fill_in 'メールアドレス', with: @user.email
    fill_in 'パスワード', with: 'wrong password'
    click_on 'ログインする'

    assert_selector ".ui.error.message", text: "メールアドレス または パスワードが異なります"
  end
end
