Rails.application.routes.draw do
  resources :measure_items, only: [:index, :show]
  resources :measurements

  namespace :admin do
    resources :users, only: [:index, :show, :update, :destroy]
    resources :measure_items, only: [:new, :create, :update, :destroy]
  end
end
