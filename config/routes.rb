Rails.application.routes.draw do
  devise_for :users

  resources :registries

  root to: "registries#index"
end
