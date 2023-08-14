Rails.application.routes.draw do
  resources :categories, only: [:index, :show, :new, :create, :destroy]
  devise_for :users
  resources :users
  root 'splash_screens#index'
end
