Rails.application.routes.draw do
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'user/new' => 'users#new'
  post 'user/new' => 'users#create'
end
