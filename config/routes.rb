Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  post '/', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :chores do
    post '/:id/assignments', to: 'assignment#create'
    patch '/:id/assignments/:id', to: 'assignment#update'
  end

  resources :dashboard, only: :index, as: 'user_dashboard'
  resources :dashboard, only: :update, as: 'join_house'

  resources :households, only: %i[index new create show] do
    resources :chores, only: %i[new create show update]
  end
end
