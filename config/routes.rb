Rails.application.routes.draw do
  devise_for :users
  resources :blogs,  only: [:index, :new, :create]

  root "blogs#index"
end
