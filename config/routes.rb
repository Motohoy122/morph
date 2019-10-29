Rails.application.routes.draw do
  devise_for :users
  resource :dashboard, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static_pages#index"
  resources :projects, only: [:index, :show]
  namespace :admin do
    resources :projects, only: [:new, :create, :show]
  end
end
