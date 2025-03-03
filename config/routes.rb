Rails.application.routes.draw do
  devise_for :users

  resources :tasks #, only: [:index, :show, :new, :create]

  root 'tasks#new'
end
