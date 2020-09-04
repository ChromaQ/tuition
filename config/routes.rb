Rails.application.routes.draw do
  resources :courses
  get 'pages/welcome'
  get 'pages/noaccess'
  get 'users/index'
  get 'profile' => 'users#show'
  devise_for :users
  resources :users
  post   'users/impersonation',      to: 'users#impersonate',        as: 'user_impersonation'
  post   'users/stop_impersonating', to: 'users#stop_impersonating', as: 'stop_user_impersonation'
  get 'impressions', to: 'users#impressions'
  get 'noaccess', to: 'pages#noaccess', as: :noaccess
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#welcome'
end
