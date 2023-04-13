Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'movies/read_csv'
  post 'movies/read_csv'
  resources :movies, only: [:index]

end
