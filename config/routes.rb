Rails.application.routes.draw do
  resources :games
  resources :collections do
    resources :games
  end
  root to: "collections#index"
end
