source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails'
gem 'pg'
gem 'puma'
gem 'sass-rails'
gem 'webpacker'
gem 'turbolinks'
gem 'jbuilder'
gem 'bcrypt'
gem 'image_processing'
gem 'bootsnap', require: false

gem 'slim-rails'                     # テンプレートエンジン
gem 'fomantic-ui-sass'               # CSSフレームワーク
# gem 'sorcery'                        # 利用者認証
gem 'zxcvbn-ruby', require: 'zxcvbn' # パスワード強度確認
gem 'pagy'                           # ページネーション
gem "aws-sdk-s3", require: false     # AWS使用の為
gem 'yard'                           # ドキュメント作成
gem 'wareki'                         # 和暦表示

group :development, :test do
  gem 'better_errors'                # エラー画面を見やすく
  gem 'binding_of_caller'            # ページフッターにデバッグ情報表示
  gem 'letter_opener_web'            # メールを参照出来る

  gem 'pry'                          # pry
  gem 'pry-rails'                    # rails consoleでirbの代わりにpryを使う
  gem 'pry-byebug'                   # デバッグを実施
  gem 'hirb'                         # console上のモデル出力を整形
  gem 'hirb-unicode'                 # console上のモデル出力を整形
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'

  gem 'letter_opener'                # メール開封
  gem 'rack-mini-profiler'           # 簡易性能測定
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'

  gem 'minitest'                     # minitest
  gem 'minitest-reporters'           # テスト結果を見やすく表示
end
