Rails.application.routes.draw do
  resources :users
  get '/' => 'users#index'
  get '/users/new' => 'users#new'

  get '/login', to: 'sesssions#new'
  get '/logout', to: 'sesssions#destroy'
  post '/sessions', to: 'sesssions#create'
end
