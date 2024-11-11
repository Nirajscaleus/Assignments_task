Rails.application.routes.draw do
  root 'tasks#index' 

  resources :tasks
  resources :users, only: [:new, :create]

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new"  
  post "/login", to: "sessions#create"  
  delete "/logout", to: "sessions#destroy"

  get "/me", to: "users#show"
  
end
