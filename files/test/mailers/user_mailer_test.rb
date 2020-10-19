require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "the truth" do
    assert true
  end

  test "歓迎メールが送信できること" do
    mail = UserMailer.welcome_email
    assert_equal "ようこそ", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "ようこそ", mail.body.encoded
  end
end
