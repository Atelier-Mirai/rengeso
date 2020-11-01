require 'test_helper'

class TaskMailerTest < ActionMailer::TestCase
  # 事前準備
  setup do
    @user = users(:taro)
    @task = @user.tasks.create(name: '本日のタスク',
                               description: 'Ruby on Railsの学習をする')
    @mail = TaskMailer.creation_email(@task)
  end

  test "タスク作成完了メールが送信されること" do
    # メール送信されるかをテスト
    assert_emails 1 do
      @mail.deliver_now
    end

    # 期待通りのメールを送信したかをテスト
    assert_equal "タスク作成完了メール", @mail.subject
    assert_equal [@user.email], @mail.to
    assert_equal ["taskleaf@example.com"], @mail.from
    assert_match "本日のタスク", @mail.html_part.body.to_s
    assert_match "Ruby on Railsの学習をする", @mail.html_part.body.to_s
    assert_match "本日のタスク", @mail.text_part.body.to_s
    assert_match "Ruby on Railsの学習をする", @mail.text_part.body.to_s
  end
end
