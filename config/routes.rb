Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  root to: "homes#index"
  resources :spots do
    resources :favorites, only: [:create, :destroy]
    resources :gone_places, only: [:create, :destroy]
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  resources :users, only: [:show]
end
