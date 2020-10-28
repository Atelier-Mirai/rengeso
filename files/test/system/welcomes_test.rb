require "application_system_test_case"

class WelcomesTest < ApplicationSystemTestCase
  test "トップページに 蓮華草 と表示されている" do
    visit root_url
    assert_selector "h1", text: "蓮華草"
  end
end
