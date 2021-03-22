# frozen_string_literal: true

Rails.application.routes.draw do
  resources :credentials
  resources :degrees
  devise_for :users
  resources :users
  resources :courses
  resources :approvals
  resources :proofs
  get 'pages/welcome'
  get 'pages/noaccess'
  get 'pages/template'
  get 'users/index'
  get 'profile' => 'users#show'

  post   'users/impersonation',      to: 'users#impersonate',        as: 'user_impersonation'
  post   'users/stop_impersonating', to: 'users#stop_impersonating', as: 'stop_impersonating_users'
  get 'courses/:id/submit', to: 'courses#submit', as: 'submit'
  get 'impressions', to: 'users#impressions'
  get 'noaccess', to: 'pages#noaccess', as: :noaccess
  get 'template', to: 'pages#template', as: :template
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#welcome'
end
