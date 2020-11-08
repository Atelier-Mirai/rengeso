source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Rails 本体
#------------------------------------------------------------------------------
gem 'rails'                          # Ruby on Rails
gem 'pg'                             # データベースに Postgresql を使う
gem 'puma'                           # Rails動作用のWeb/アプリケーションサーバ
gem 'sass-rails'                     # Sassを使って効率的にcssを書く
gem 'webpacker'                      # フロントエンド開発で使われているwebpack用のgem
gem 'turbolinks'                     # 画面遷移を高速化するためのgem
gem 'jbuilder'                       # JSON形式のデータ作成に便利なgem
gem 'bcrypt'                         # 安全なパスワードなど、暗号化の為のgem
gem 'image_processing'               # 画像処理用
gem 'bootsnap', require: false       # Railsの高速化のためのgem

# 便利なgem
#------------------------------------------------------------------------------
gem 'slim-rails'                     # Slimを使って効率的にhtmlを記述する
gem 'fomantic-ui-sass'               # CSSフレームワーク
# gem 'sorcery'                        # 利用者認証
# gem 'zxcvbn-ruby', require: 'zxcvbn' # パスワード強度確認
gem 'cloudinary', require: true
gem 'activestorage-cloudinary-service'
gem 'active_storage_validations'     # 画像ファイルのバリデーション用
gem 'pagy'                           # ページネーション
gem 'rails_autolink'                 # URLを自動的にリンクとして表示する
gem 'ransack'                        # 検索機能、並び替え機能の実装
gem 'wareki'                         # 和暦表示
gem 'yard'                           # ドキュメント作成

# 開発用、テスト用のgem
#------------------------------------------------------------------------------
group :development, :test do
  gem 'better_errors'                # エラー画面を見やすく
  gem 'binding_of_caller'            # ページフッターにデバッグ情報表示

  gem 'pry-rails'                    # rails consoleでirbの代わりにpryを使う
  gem 'pry-byebug'                   # binding.pry として、デバッグを実施
  gem 'hirb'                         # console上のモデル出力を整形
  gem 'hirb-unicode'                 # hirbでの日本語出力を調整
end

# 開発用のgem
#------------------------------------------------------------------------------
group :development do
  gem 'web-console'                  # console と書き、ブラウザ上でデバックする
  gem 'listen'                       # ファイルの変更をリッスンし、変更内容を通知
  gem 'spring'                       # railsコマンドの実行を速くする
  gem 'spring-watcher-listen'

  gem 'letter_opener_web'            # メール開封
  gem 'rack-mini-profiler'           # 簡易性能測定
end

# テスト用のgem
#------------------------------------------------------------------------------
group :test do
  gem 'capybara'                     # 仮想的に利用者のブラウザ操作を行う
  gem 'selenium-webdriver'
  gem 'webdrivers'

  gem 'minitest'                     # Rails標準のテスト用フレームワーク
  gem 'minitest-reporters'           # テスト結果を見やすく表示
end
