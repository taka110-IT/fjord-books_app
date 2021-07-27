Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show) do
    resource :relationships, only: %i(create destroy)
    get :followings, on: :member
    get :followers, on: :member
  end
end
