Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :farms do
    resource :bookings, only: [:new, :create]
  end

  resource :bookings, only: [:destroy] do
    member do
      patch "approved"
    end
  end

  get '/dashboard', to: "dashboard#index"

end
