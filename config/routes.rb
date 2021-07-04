Rails.application.routes.draw do
  root 'books#index'

  devise_for :users
  resources :books

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  get 'users/index'
  get 'users/:id', to: 'users#show', as: 'user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
