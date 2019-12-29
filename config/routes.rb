Rails.application.routes.draw do
  devise_for :users
  root to:'articles#index'

  resources :users,         only:[:index, :show]

  resources :groups,        only:[:new, :create, :index, :destroy] do
    resources :messages,    only:[:index, :create]
  end

  resources :gametitles,    only:[:index, :search] do
    collection do
      get :search
    end
  end

  resources :articles do
    resources :comments,      only:[:create] 
    collection do
      get :search
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
