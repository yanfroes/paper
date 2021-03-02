Rails.application.routes.draw do
  root 'books#index'
  resources :books
  resources :people
  resources :editions

  resources :versions, only: [:show] do
    member do
      post :restore
      post :revert
    end
  end
  
end
