Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources 'groups'
  resources 'messages', only: [:index, :create]
end
