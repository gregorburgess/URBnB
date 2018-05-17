Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'

  resources :farms, only: [:new, :create, :edit, :update, :index, :destroy] do
    resource :bookings, only: [:new, :create]

    collection do
      get 'myfarms', to: "farms#myfarms"
    end

  end

  resource :bookings, only: [:destroy] do
    member do
      patch "approved"
    end
  end

  get '/dashboard', to: "dashboard#index"

end
