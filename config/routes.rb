Rails.application.routes.draw do
  get 'pages/welcome'
  get 'pages/noaccess'
  get 'users/index'
  devise_for :users
  resources :users, only: [:index] do
    post :impersonate, on: :member
    post :stop_impersonating, on: :collection
  end
  get 'impressions', to: 'users#impressions'
  get 'noaccess', to: 'pages#noaccess', as: :noaccess
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#welcome'
end
