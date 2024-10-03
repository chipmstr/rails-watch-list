Rails.application.routes.draw do
  # reveal health status on /up
  get "up" => "rails/health#show", as: :rails_health_check

  # routes for movies
  resources :movies  # This line generates all standard routes

  # routes for lists and nested bookmarks
  resources :lists, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :bookmarks, only: [:new, :create, :destroy, :edit, :update]
  end

  # separate route for destroying bookmarks
  resources :bookmarks, only: [:destroy]

  # defines the root path route ("/")
  root "lists#index"  # Optional: Set this as the home page
end
