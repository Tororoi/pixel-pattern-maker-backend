Rails.application.routes.draw do
  resources :palettes, only: [:create, :index, :update, :destroy]
  resources :patterns, only: [:create, :index, :update, :destroy]
  resources :users, only: [:create, :index, :update, :destroy]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  get '/persist', to: 'auth#persist'
  post '/favorite', to: 'users#fave_pattern'
  delete '/favorite', to: 'users#unfave_pattern'
end
