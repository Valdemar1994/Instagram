Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  
  resources :users, only: [:index, :show, :edit, :update] do
    resources :follows, only: [:index, :show, :create]
  end

  resources :follows, only: [:destroy]

  resources :posts, only: [:new, :create, :show] do
    resources :likes
  end

  resources :comments, only: [:create]
end
