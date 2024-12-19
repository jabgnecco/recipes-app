Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :recipes do
    resources :reviews, only: [:create, :destroy]  # Reviews nested within recipes
  end

  # get "recipes", to: "recipes#index"
  # get "recipes/new", to: "recipes#new"
  # get "recipes/:id", to: "recipes#show", as: :recipe
  # post "recipes", to: "recipes#create"
  # get "recipes/:id/edit", to: "recipes#edit"
  # patch "recipes/:id", to: "recipes#update"
  # delete "recipes/:id", to: "recipes#destroy"
end
