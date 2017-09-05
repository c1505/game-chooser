Rails.application.routes.draw do
  resources :games
  root to: "games#index"
  post '/filter', to: "games#filter"
  get '/filter', to: "games#index"
end
