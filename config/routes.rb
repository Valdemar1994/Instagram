Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :users, only: %i[index show edit update] do
    collection { patch :update }
    resources :follows, only: %i[index show create]
  end

  resources :follows, only: [:destroy]

  resources :posts, only: %i[new create show edit update destroy] do
    collection { patch :update }
    collection { patch :delete }
    resources :likes
  end

  resources :comments, only: [:create]
end
