Rails.application.routes.draw do
  # reveal health status on /up
  get "up" => "rails/health#show", as: :rails_health_check

  # routes for movies
  resources :movies   # This line generates all standard routes

  # routes for lists and nested bookmarks
  resources :lists do
    resources :bookmarks, only: [:new, :create, :destroy, :edit, :update]
  end

  resources :movies do
    resources :reviews
  end

  # defines the root path route ("/")
  root "lists#index"  # Optional: Set this as the home page
end
