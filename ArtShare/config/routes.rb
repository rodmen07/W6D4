Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  resources :users do
    resources :artworks, only: :index
  end
  resources :artworks
  resources :artwork_shares, only: [:create, :destroy]
  # root "articles#index"
end
