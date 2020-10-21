Rails.application.routes.draw do

  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :measure_items, only: [:index, :show]
    resources :measurements
    get '/measurements', to: 'measurements#index', as: "today_measure"

    namespace :admin do
      resources :users, only: [:index, :show, :update, :destroy]
      resources :measure_items, only: [:create, :update, :destroy]
    end
  end

  post 'auth/login', to: 'authentication#authenticate'
  post '/signup', to: 'users#create'
end
