Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "plans#index"
  get 'plans/search'
  
  resources :phrases

  resources :plans do
    resource :bookmarks, only: [:create, :destroy]
    collection do
      get :bookmarks
    end
  end
  
  resources :users, only: [:show, :edit, :update] 
  
end
