def get_remote(src, dest = nil)
  dest ||= src
  repo = "https://raw.github.com/Atelier-Mirai/rengeso/main/files/"
  remote_file = repo + src
  remove_file dest
  get(remote_file, dest)
end

# アプリ名の取得
@app_name = app_name

# gitignore
get_remote("gitignore", ".gitignore")

# Gemfile
get_remote "Gemfile"

# Database
get_remote "config/database.yml.example", "config/database.yml"
gsub_file "config/database.yml", /myapp/, @app_name

# install gems
run "bundle install"

# create db
run "bundle exec rails db:create"

# set config/application.rb
application  do
  %q{
    config.i18n.default_locale            = :ja          # ロケールを日本に設定
    config.time_zone                      = "Asia/Tokyo" # 日本中央標準時で、時刻を表示
    config.active_record.default_timezone = :local       # DBにローカル時刻で保存する

    # config.active_storage.variant_processor = :vips      # 画像変換にlibvipsを使う
  }
end

# app/assets/config
get_remote "app/assets/config/manifest.js"

# app/assets/images/
remove_file "app/assets/images/.keep"
get_remote "app/assets/images/apple-touch-icon-180x180.png"
get_remote "app/assets/images/favicon.ico"
get_remote "app/assets/images/logo.jpg"
get_remote "app/assets/images/renge.jpg"

# app/assets/javascripts/
get_remote "app/assets/javascripts/application.js"
get_remote "app/assets/javascripts/semantic-ui-customize.js"

# app/assets/stylesheets/
remove_file "app/assets/stylesheets/application.css"
get_remote "app/assets/stylesheets/application.scss"
get_remote "app/assets/stylesheets/utilities/utility.scss"
get_remote "app/assets/stylesheets/utilities/_display.scss"
get_remote "app/assets/stylesheets/utilities/_spacing.scss"
get_remote "app/assets/stylesheets/_iro.scss"
get_remote "app/assets/stylesheets/_header.scss"
get_remote "app/assets/stylesheets/_footer.scss"

# app/controllers/
get_remote "app/controllers/application_controller.rb"
get_remote "app/controllers/errors_controller.rb"
get_remote "app/controllers/users_controller.rb"
get_remote "app/controllers/welcome_controller.rb"

# # app/helpers/
get_remote "app/helpers/application_helper.rb"

# app/javascript/packs/
get_remote "app/javascript/packs/application.js"

# app/mailers
# get_remote "app/mailers/application_mailer.rb"

# app/views/
get_remote "app/views/application/internal_server_error.html.slim"
get_remote "app/views/application/not_found.html.slim"

remove_file "app/views/layouts/application.html.erb"
remove_file "app/views/layouts/mailer.html.erb"
remove_file "app/views/layouts/mailer.text.erb"

get_remote "app/views/layouts/_header.slim"
get_remote "app/views/layouts/_footer.slim"
get_remote "app/views/layouts/_sidebar.slim"
get_remote "app/views/layouts/application.html.slim"
get_remote "app/views/layouts/mailer.html.slim"
get_remote "app/views/layouts/mailer.text.slim"

get_remote "app/views/users/_form.html.slim"
get_remote "app/views/users/edit.html.slim"
get_remote "app/views/users/index.html.slim"
get_remote "app/views/users/new.html.slim"
get_remote "app/views/users/show.html.slim"

get_remote "app/views/welcome/index.html.slim"

# config/environments/
# For letter opener
insert_into_file 'config/environments/development.rb',%(

  # letter opener
  config.action_mailer.default_url_options = { host: 'localhost:3000' }
  config.action_mailer.perform_caching = true
  config.action_mailer.delivery_method = :letter_opener_web
  config.action_mailer.perform_deliveries = true
), after: 'config.action_mailer.raise_delivery_errors = false'

# For SENDGRID
insert_into_file 'config/environments/production.rb',%(

  # Use SendGrid - Add-ons - Heroku
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { host: 'heroku.com' }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.smtp_settings = {
      user_name: 'apikey',
      password: ENV['SENDGRID_APIKEY'],
      domain: 'heroku.com',
      address: 'smtp.sendgrid.net',
      port: 587,
      authentication: :plain,
      enable_starttls_auto: true
  }
), after: '# config.action_mailer.raise_delivery_errors = false'

# config/initializers/
get_remote "config/initializers/exceptions_app.rb"
file 'config/initializers/generators.rb', <<~EOF
  Rails.application.config.generators do |g|
    g.helper      false
    g.assets      false
  end
EOF
get "https://raw.github.com/ddnexus/pagy/master/lib/config/pagy.rb", "config/initializers/pagy.rb"

# config/initializers/locales
get_remote "config/locales/ja.yml"

# config/routes.rb
get_remote "config/routes.rb"
get_remote "config/cloudinary.yml"
get_remote "config/storage.yml"

# test/
get_remote "test/fixtures/tasks.yml"
get_remote "test/fixtures/users.yml"
get_remote "test/mailers/task_mailer_test.rb"
get_remote "test/system/tasks_test.rb"
get_remote "test/system/users_test.rb"
get_remote "test/system/welcomes_test.rb"
get_remote "test/application_system_test_case.rb"
get_remote "test/login_helper.rb"
get_remote "test/test_helper.rb"

# For pry
get_remote ".pryrc"
get_remote "Procfile"

after_bundle do
  # config/webpack/
  get_remote "config/webpack/environment.js"

  # Fomantic UI & jQuery
  run "yarn add jquery"

  # git
  git :init
  git add: '.'
  git commit: "-am 'rails new #{@app_name} -m https://raw.github.com/Atelier-Mirai/rengeso/main/rengeso.rb'"
end
