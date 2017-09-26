Rails.application.routes.draw do
  devise_for :users
  resources :games
  resources :collections do
    resources :games
  end
  root to: "collections#index"
end
