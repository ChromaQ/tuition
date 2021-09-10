# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#welcome'
  get 'pages/welcome'
  get '/rails/mailers/user_mailer', as: :emails
  get 'noaccess', to: 'pages#noaccess', as: :noaccess
  get 'template', to: 'pages#template', as: :template
  get 'hr', to: 'pages#hr', as: :hr

  resources :credentials
  resources :degrees
  resources :approvals

  resources :goals
  get 'goals/update_credentials', as: 'update_credentials'
  get 'goals/:id/submit', to: 'goals#submit', as: 'submit_goal'
  post 'goals/:id/approve', to: 'goals#approve', as: 'approve_goal'

  get 'autocomplete/schools', to: 'autocomplete#schools', constraints: { format: %w[js json] }, as: :autocomplete_schools
  post 'autocomplete/create_school/:school_name', to: 'autocomplete#create_school', as: :create_school_by_name, constraints: { format: %w[js json] }

  resources :courses
  get 'courses/:id/submit', to: 'courses#submit', as: 'submit'
  post 'courses/:id/approve', to: 'courses#approve', as: 'approve'
  patch 'courses/:id/withdraw', to: 'courses#withdraw', as: 'withdraw'

  resources :proofs
  get 'proofs/:id/submit', to: 'proofs#submit', as: 'submit_proof'
  post 'proofs/:id/approve', to: 'proofs#approve', as: 'approve_proof'

  devise_for :users
  resources :users
  post   'users/impersonation',      to: 'users#impersonate',        as: 'user_impersonation'
  post   'users/stop_impersonating', to: 'users#stop_impersonating', as: 'stop_impersonating_users'
  get 'impressions', to: 'users#impressions'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
