require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:taro)
  end

  # test "visiting the index" do
  #   visit users_url
  #   assert_selector "h1", text: "Users"
  # end
  #

  test "パスワードが正しいと、ログインできる" do
    # login_as(@user)
    visit login_url
    # fill_in '電子メール', with: @user.email
    fill_in '名前', with: @user.name
    fill_in 'パスワード', with: 'secret'
    click_on 'ログインする'

    assert_selector ".ui.success.message", text: "ログインしました。"
  end

  test "パスワードが違うと、ログインできない" do
    # digest = BCrypt::Password.create('wrong password', cost: BCrypt::Engine::MIN_COST)
    # @user.update_columns(password_digest: digest)
    visit login_url
    # fill_in '電子メール', with: @user.email
    fill_in '名前', with: @user.name
    fill_in 'パスワード', with: 'wrong password'
    click_on 'ログインする'
    # login_as(@user)

    assert_selector ".ui.warning.message", text: "名前またはパスワードが違います"
  end

  test "パスワードの変更ができる" do
    # digest = BCrypt::Password.create('wrong password', cost: BCrypt::Engine::MIN_COST)
    # @user.update_columns(password_digest: digest)
    visit password_resets_url
    # fill_in '電子メール', with: @user.email
    fill_in '名前', with: @user.name
    fill_in 'パスワード', with: 'new password'
    click_on '変更する'

    visit login_url
    fill_in '名前', with: @user.name
    fill_in 'パスワード', with: 'new password'
    click_on 'ログインする'

    assert_selector ".ui.success.message", text: "ログインしました。"
  end


  # test "creating a User" do
  #   visit users_url
  #   click_on "New User"
  #
  #   click_on "Create User"
  #
  #   assert_text "User was successfully created"
  #   click_on "Back"
  # end
  #
  # test "updating a User" do
  #   visit users_url
  #   click_on "Edit", match: :first
  #
  #   click_on "Update User"
  #
  #   assert_text "User was successfully updated"
  #   click_on "Back"
  # end
  #
  # test "destroying a User" do
  #   visit users_url
  #   page.accept_confirm do
  #     click_on "Destroy", match: :first
  #   end
  #
  #   assert_text "User was successfully destroyed"
  # end
end
