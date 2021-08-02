Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  get '/dashboard', to: 'dashboard#show'
  get '/auth/:provider/callback', to: 'sessions#create'
  namespace :user do
      resources :dashboard, only: :show
    end
  resources :households, only: %i[new create]

  post '/', to:'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
