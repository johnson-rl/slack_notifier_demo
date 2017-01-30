Rails.application.routes.draw do
  resources :users
  get '/' => 'users#index'
  get '/users/new' => 'users#new'

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'
end
