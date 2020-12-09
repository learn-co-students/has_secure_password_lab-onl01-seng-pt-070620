Rails.application.routes.draw do

  resources :users
  get '/', to: 'users#welcome'  #root page or homepage
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/signout', to: 'sessions#destroy'
end
