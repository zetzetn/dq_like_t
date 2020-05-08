Rails.application.routes.draw do
  
  devise_for :users
  root 'games#index'

  get '/start', to: 'games#start'
  get '/battle', to: 'games#battle'

  resources :braves, only: :update
end
