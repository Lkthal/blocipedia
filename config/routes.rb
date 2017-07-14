Rails.application.routes.draw do

  resources :wikis

  devise_for :users
  
  resources :users, only: [:show] do
    get :downgrade_account
  end

  resources :charges, only: [:new, :create]

  get 'welcome/index'

  root 'welcome#index'

end
