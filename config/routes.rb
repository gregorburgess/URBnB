Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  resources :farms, only: [:new, :show, :create, :edit, :update, :index, :destroy] do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :bookings, only: [:new, :create]
  end

  resource :bookings, only: [:destroy] do
    member do
      patch "approved"
    end
  end

  get '/dashboard', to: "dashboard#index"

end
