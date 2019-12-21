Rails.application.routes.draw do
  resources :gropups
  devise_for :users
  resources :articles do
    resources :comments,      only:[:create] 
  end
  resources :users,         only:[:index, :show] 
  root to:'articles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
