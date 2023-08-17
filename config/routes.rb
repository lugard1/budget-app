Rails.application.routes.draw do
  devise_for :users

  unauthenticated :user do
    root 'splash_screens#index', as: :unauthenticated_root
  end

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end

  resources :users
  resources :categories, only: [:index, :show, :new, :create, :destroy] do
    resources :expenses, only: [:new, :create, :destroy]
  end
end
