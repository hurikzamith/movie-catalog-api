Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'movies/read_csv'
  resources :movies, only: [:index]

  # post 'movies/create_from_csv'
  # resources :movies, only:
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
