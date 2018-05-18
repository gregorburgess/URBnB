Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'

  resources :farms, only: [:new, :create, :edit, :update, :index, :show, :destroy] do
    resource :bookings, only: [:new, :create]

    collection do
      get 'myfarms', to: "farms#myfarms"
    end
  end

  resources :bookings, only: [:edit, :update, :destroy]

  get '/dashboard', to: "dashboard#index"
  get '/dashboard/owner', to: "dashboard#index_owner", as: :dashboard_owner
  patch '/dashboard/approve/:id', to: "bookings#approve", as: :dashboard_approve
  patch '/dashboard/declined/:id', to: "bookings#declined", as: :dashboard_decline
  patch '/dashboard/review/:id', to: "dashboard#review", as: :dashboard_review

end
