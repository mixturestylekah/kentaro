Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :blogs
  resources :tags, only: :show
  resources :users, only: :show

  namespace :api do
    resources :blogs, only: [:create, :update, :destroy]
    resources :tags,  only: :create
    resources :users, only: :show
  end

  root 'blogs#index'
end
