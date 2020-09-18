Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :courses do
    end
  get 'pages/welcome'
  get 'pages/noaccess'
  get 'pages/template'
  get 'users/index'
  get 'profile' => 'users#show'

  post   'users/impersonation',      to: 'users#impersonate',        as: 'user_impersonation'
  post   'users/stop_impersonating', to: 'users#stop_impersonating', as: 'stop_user_impersonation'
  get 'impressions', to: 'users#impressions'
  get 'noaccess', to: 'pages#noaccess', as: :noaccess
  get 'template', to: 'pages#template', as: :template
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#welcome'
end
