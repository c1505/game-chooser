Rails.application.routes.draw do
  resources :games
  resources :collections
  root to: "games#index"
  post '/filter/:id', to: "collections#filter"
  get '/filter/:id', to: "collections#show"
end
