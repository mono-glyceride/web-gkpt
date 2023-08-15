Rails.application.routes.draw do
  devise_for :users
  resources :reviews, only:[ :index, :show, :new, :create, :destroy ]
end
