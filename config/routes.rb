Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  post '/', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :dashboard, only: :index, as: 'user_dashboard'
  resources :dashboard, only: :update, as: 'join_house'

  resources :households, only: %i[new create show] do
    resources :chores, only: %i[new create show update]
  end

  # get '/join_house', to: 'households#update'
end
