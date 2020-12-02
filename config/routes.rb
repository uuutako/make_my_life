Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to:'plans#index'
  resources :users, only: :new  
  resources :plans, only: [:new, :create, :show, :edit, :update] do
    resources :comments, only: [:index, :create]
  end
end
