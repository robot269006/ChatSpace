Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  get 'groups/new' => 'groups#new'
  get 'groups/edit' => 'groups#edit'
end
