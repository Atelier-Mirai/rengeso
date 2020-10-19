module LoginHelper
  def login_user(user)
    post login_path, params: { email: user.name, password: 'secret' }
    follow_redirect!
  end
end

class ActionDispatch::IntegrationTest
  # include Sorcery::TestHelpers::Rails::Integration
  include LoginHelper
end
