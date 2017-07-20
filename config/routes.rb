Rails.application.routes.draw do

  resources :collaborators

  devise_for :users
  
  resources :users, only: [:show] do
    get :downgrade_account
  end

  resources :charges, only: [:new, :create]

  resources :wikis do
    resources :collaborators, only: [:new, :create, :destroy]
  end

  get 'welcome/index'

  root 'welcome#index'

end
