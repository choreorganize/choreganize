Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  namespace :user do
    resources :dashboard, only: :show
  end
  get '/dashboard', to: 'dashboard#show'

  resources :households, only: %i[new create]
end
