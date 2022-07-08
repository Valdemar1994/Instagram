Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :users, only: %i[index show edit update] do
    resources :follows, only: %i[index show create]
  end

  resources :follows, only: [:destroy]

  resources :posts, only: %i[new create show edit update destroy] do
    resources :likes
  end

  resources :comments, only: [:create]
end
