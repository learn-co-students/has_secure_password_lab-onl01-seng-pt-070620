Rails.application.routes.draw do
  root 'users#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'session#destroy'

  resources :users

end
