Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to:'plans#index'
  get 'plans/search'
  resources :users,      only: [:show, :edit, :update] 
  resources :phrases
  resources :plans do
    resources :comments, only: [:index, :create]
  end

  
end
