Rails.application.routes.draw do
  devise_for :users

  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]

  resources :picks do
    resources :comments, only: [:create]
  end

  resources :artists, only: [:show]

  root 'picks#index'
end