Rails.application.routes.draw do
  resources :registries
  resources :gifts, only: [:create]

  root to: "registries#index"
end
