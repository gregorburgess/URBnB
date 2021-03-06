Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'

  resources :farms, only: [:new, :create, :edit, :update, :index, :show, :destroy,] do
    resource :bookings, only: [:new, :create]

    collection do
      get 'myfarms', to: "farms#myfarms"
    end
  end

  resources :bookings, only: [:edit, :update, :destroy] do

    resource :reviews, only: [:new, :create]

  end

   resources :reviews, only: [:edit, :update]

  get '/dashboard', to: "dashboard#index"
  get '/dashboard/owner', to: "dashboard#index_owner", as: :dashboard_owner

  patch '/dashboard/review/:id', to: "dashboard#review", as: :dashboard_review
  patch '/dashboard/approve/:id', to: "bookings#approve", as: :dashboard_approve
  patch '/dashboard/decline/:id', to: "bookings#decline", as: :dashboard_decline


end

