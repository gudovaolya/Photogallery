Rails.application.routes.draw do


  root 'photos#index'

  get 'users/show/:id' => 'users#show', as: 'profile'

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :photos

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
