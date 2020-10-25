Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :users

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
