Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  post '/', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post '/chores/:id/assignments', to: 'assignment#create'
  patch '/chores/:id/assignments/:id', to: 'assignment#update'

  resources :dashboard, only: :index, as: 'user_dashboard'

  resources :households, only: %i[new create show] do
    resources :chores, only: %i[new create show]  #possibly add, destroy
  end

end
