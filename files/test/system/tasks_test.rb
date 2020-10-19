require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @taro = users(:taro)
    @jiro = users(:jiro)
    @taro_task = tasks(:taro_task)
    @jiro_task = tasks(:jiro_task)
  end

  test "太郎でログインすると、太郎が作成したタスクが表示される" do
    login_as(@taro)
    visit tasks_path
    assert_text @taro_task.name
  end

  test "太郎でログインすると、太郎が作成したタスクが詳細表示される" do
    login_as(@taro)
    visit task_path(@taro_task)
    assert_text @taro_task.name
  end

  test "次郎でログインすると、太郎が作成したタスクが表示されない" do
    login_as(@jiro)
    visit tasks_path
    assert_no_text @taro_task.name
  end

  test "新規作成できる" do
    login_as(@taro)
    visit new_task_path
    fill_in '名称', with: '新しい太郎のタスク'
    click_on '登録する'

    assert_selector '.ui.success.message', text: '新しい太郎のタスク'
    within 'table' do
      assert_text '新しい太郎のタスク'
    end
  end

  test "名称がないタスクは新規作成できない" do
    login_as(@taro)
    visit new_task_path
    fill_in '名称', with: ''
    click_on '登録する'

    within '#error_explanation' do
      assert_text '名称を入力してください'
    end
  end

  test "編集できる" do
    login_as(@taro)
    visit tasks_path
    click_on '編集', match: :first

    fill_in '名称', with: '編集した太郎のタスク'
    click_on '更新する'

    assert_selector '.ui.info.message', text: '編集した太郎のタスク'
    within 'table' do
      assert_text '編集した太郎のタスク'
    end
  end

  test "削除できる" do
    login_as(@taro)
    visit tasks_path
    click_on '削除', match: :first
    accept_confirm
    assert_selector '.ui.warning.message', text: '削除しました'
  end
end
