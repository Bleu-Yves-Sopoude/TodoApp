Rails.application.routes.draw do

  resources :tasks #, only: [:index, :show, :new, :create]

  root 'tasks#new'
end
