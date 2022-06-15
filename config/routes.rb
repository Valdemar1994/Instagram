Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  
  resources :users, only: [:show, :edit, :update] do 
    resources :follows, only: [:create]
  end

  resources :follows, only: [:destroy]

  resources :posts, only: [:new, :create, :show] do
    resources :likes
  end

  resources :comments, only: [:create]
end
