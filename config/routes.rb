Rails.application.routes.draw do
  get 'dashboard/user_show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/dashboard', to: 'dashboard#show'  #

  root 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :dashboard, only: :show, as: "user_dashboard"

  resources :households, only: %i[new create show] do
    resources :chores, only: %i[new create show]
  end

  post '/', to:'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
