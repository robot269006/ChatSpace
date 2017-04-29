Rails.application.routes.draw do
  devise_for :users
  root 'sessions#new'
  resources :groups do
    resources :messages, only: [:index, :create]
  end
end
