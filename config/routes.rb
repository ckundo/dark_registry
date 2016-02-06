Rails.application.routes.draw do
  devise_for :users

  resources :registries
  resources :gifts, only: [:create]

  root to: "registries#index"
end
