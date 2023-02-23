Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  resources :groups, only: [:index, :new, :create] do
    resources :entities, only: [:index]
  end

  resources :entities, only: [:new, :create]
end
