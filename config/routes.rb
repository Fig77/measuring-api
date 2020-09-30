Rails.application.routes.draw do
  resources :measure_items, only: [:index, :show] do
    resources :measurements
  end
end
