Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'posts#index'
  resources :posts,only: [:show, :index, :new, :create]
  resources :pictures ,only: [:create, :destroy]
  resources :tags ,only: [:show]

  namespace :admin do
    resources :posts, except: [:show, :index]
    resources :pictures ,only: [:create, :destroy]


  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
