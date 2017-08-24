Rails.application.routes.draw do
  root "users#index"

  get 'register' => 'users#new'
  post 'users' => 'users#create'
  get 'users/:id' => 'users#description'
  get 'users' => 'users#show', as: :user
  patch "users/:id" => "users#update"
  get 'users/:id/edit' => "users#edit"
  delete "users/:id" => "users#destroy"

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'networks/:id' => 'networks#show', as: :networks
  delete "networks/:id" => "networks#destroy"

  post 'invites/:id' => 'invites#create'
  delete 'invites/:id' => 'invites#destroy'

  post 'friendships/:id' => 'friendships#create'
  delete 'friendships/:id' => 'friendships#destroy'
end
