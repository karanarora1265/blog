Rails.application.routes.draw do
  resources :articles do
  	resources :comments, only: [:index, :create]
  end

  resources :comments do
  	resources :comments, only: [:new, :create]
  end

  devise_for :users
  root to: 'articles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
