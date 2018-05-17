Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :farms, only: [:new, :create, :edit, :update, :index, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
