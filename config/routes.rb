Rails.application.routes.draw do
  resources :payments
  resources :cards, only:[:index,:create, :show, :destroy]
  resources :users, only:[:index,:create, :show, :destroy]
  post "/signup", to: "users#create"
  get "/me", to: "users#show"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  post "/pay", to: "payments#create"
  get "/transaction", to: "payments#show"
end
