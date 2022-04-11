Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  resources :spots, only: [:index, :new, :create, :show]
end
