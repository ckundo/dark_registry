Rails.application.routes.draw do
  root to: "registry#index"

  devise_for :users
end
