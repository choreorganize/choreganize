Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/o/oauth2/auth', to: 'sessions#create'

  post '/', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :dashboard, only: :show
  resources :dashboard, only: :index, as: 'user_dashboard'

  resources :households, only: %i[new create show] do
    resources :chores, only: %i[new create show]
  end
end
