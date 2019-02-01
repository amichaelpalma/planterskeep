Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Root
  root 'plants#index'

  # Plants
  resources 'plants'

  # Users
  resources 'users'
end
