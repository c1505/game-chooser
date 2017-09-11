Rails.application.routes.draw do
  resources :games
  resources :collections do
    resources :games
  end
  root to: "collections#index"
  post '/filter/:id', to: "collections#filter"
  get '/filter/:id', to: "collections#show"
end
