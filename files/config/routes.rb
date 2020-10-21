Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :users do
    member do
      get :activate
    end
  end

  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get    'signup', to: 'users#new'

  resources :password_resets, only: [:create, :edit, :update]

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
