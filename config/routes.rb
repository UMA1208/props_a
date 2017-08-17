Rails.application.routes.draw do
  resources :ppicks 
  root 'picks#index'
end