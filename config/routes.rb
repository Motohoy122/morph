Rails.application.routes.draw do
  resources :events
  resources :user_types, only: [:new, :create, :show]
  devise_for :companies
  resources :organizations, only: [:new, :create, :show]
  devise_for :users
  resource :dashboard, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static_pages#index"
  resources :projects, only: [:index, :show]
  resources :schedules, only: [:index, :show]
  resources :events
  resources :crews, only: [:index, :show]
  resources :tasks, only: [:index, :show]
  resources :equipment, only: [:index, :show]
  resources :my_groups, only: [:index, :show]
  namespace :admin do
    resources :projects, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :schedules, only: [:new, :create, :show]
    resources :tasks, only: [:new, :create, :edit, :update, :destroy]
    resources :crews, only: [:new, :create, :edit, :update, :destroy]
    resources :equipment, only: [:new, :create, :edit, :update, :destroy]
    resources :my_groups, only: [:new, :create]
  end
  namespace :schedule do
    resources :tasks, only: [:update]
  end
end
