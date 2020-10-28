module LoginHelper
  def login_as(user)
    case
    when respond_to?(:visit) # システムテスト
      visit login_url
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード', with: 'password'
      click_on 'ログインする'
    when respond_to?(:get) # 結合テスト・機能テスト
      post login_path, params: { session: { email: user.name, password: 'password' } }
    else
      raise NotImplementedError.now
    end

    @current_user = user
  end

  def current_user
    @current_user
  end
end

class ActionDispatch::IntegrationTest
  # include Sorcery::TestHelpers::Rails::Integration
  include LoginHelper
end
