Rails.application.routes.draw do
  resources :users
  root 'splash_screens#index'
end
