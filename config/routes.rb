Rails.application.routes.draw do
  
  root 'contents#index'
  resources :contents, only: :index
  resources :about, only: :index
  
end
