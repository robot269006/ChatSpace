Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :users, only: [:search] do
    collection do
      get 'search', :action => :search
    end
  end
  resources :groups, except: [:show, :destroy] do
    resources :messages, only: [:index, :create]
  end
end
