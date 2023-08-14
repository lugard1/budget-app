Rails.application.routes.draw do
  resources :categories
  devise_for :users
  resources :users
  root 'splash_screens#index'
end
