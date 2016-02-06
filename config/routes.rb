Rails.application.routes.draw do
  devise_for :users

  resource :registry

  root to: "registries#show"
end
