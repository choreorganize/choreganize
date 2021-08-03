Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  post '/', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :dashboard, only: :index, as: 'user_dashboard'

  resources :households, only: %i[new create show] do
    resources :chores, only: %i[new create show]
  end
end
