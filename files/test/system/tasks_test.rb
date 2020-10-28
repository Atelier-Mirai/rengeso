require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @taro       = users(:taro)
    @jiro       = users(:jiro)

    @taro_task1 = tasks(:taro_task1)
    @taro_task2 = tasks(:taro_task2)
    @taro_task3 = tasks(:taro_task3)

    @jiro_task1 = tasks(:jiro_task1)
  end

  test "太郎でログインすると、太郎が作成したタスクが一覧表示される" do
    login_as(@taro)
    visit tasks_path
    assert_text @taro_task1.name
    assert_text @taro_task2.name
    assert_text @taro_task3.name
  end

  test "太郎でログインすると、太郎が作成したタスクが詳細表示される" do
    login_as(@taro)
    visit task_path(@taro_task1)
    assert_text @taro_task1.name
    assert_text @taro_task1.description
  end

  test "次郎でログインすると、太郎が作成したタスクが表示されない" do
    login_as(@jiro)
    visit tasks_path
    assert_no_text @taro_task1.name
  end

  test "新規作成画面で名前を入力すると、タスクが登録できる" do
    login_as(@taro)
    visit new_task_path
    fill_in '名前', with: '新しい太郎のタスク'
    click_on '登録する'

    assert_selector '.ui.success.message', text: '新しい太郎のタスク'
    within 'table' do
      assert_text '新しい太郎のタスク'
    end
  end

  test "新規作成画面で名前がないと、エラーが表示される" do
    login_as(@taro)
    visit new_task_path
    fill_in '名前', with: '   '
    click_on '登録する'

    within '#error_explanation' do
      assert_text '名前を入力してください'
    end
  end

  test "自分のタスクを編輯できる" do
    login_as(@taro)
    visit tasks_path
    click_on '編輯', match: :first

    fill_in '名前', with: '編輯した太郎のタスク'
    click_on '更新する'

    assert_selector '.ui.success.message', text: '編輯した太郎のタスク'
    within 'table' do
      assert_text '編輯した太郎のタスク'
    end
  end

  test "自分のタスクは削除できる" do
    login_as(@taro)
    assert_equal 3, current_user.tasks.count
    visit tasks_path
    click_on '削除', match: :first
    accept_confirm
    assert_selector '.ui.success.message', text: '削除しました'
    assert_equal 2, current_user.tasks.count
  end
end
