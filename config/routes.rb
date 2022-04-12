Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  resources :spots do
    resources :favorites, only: [:create, :destroy]
    resources :gone_places, only: [:create, :destroy]
  end
end
