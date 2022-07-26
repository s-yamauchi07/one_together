Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  root to: "homes#index"
  resources :spots do
    resources :favorites, only: [:create, :destroy]
    resources :gone_places, only: [:create, :destroy]
    resources :comments, only: [:create, :edit, :update, :destroy]
    collection do
      get "search"
      get "tag_search"
    end
  end
  resources :users, only: [:show]
  # asオプションを付けることで、prefixに任意のpath名を設定できる
  get "/users/:id/unsubscribe" => "users#unsubscribe", as: "unsubscribe"
  patch "/users/:id/withdrawal" => "users#withdrawal", as: "withdrawal"
end
