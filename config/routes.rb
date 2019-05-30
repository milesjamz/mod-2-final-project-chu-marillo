Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  get 'welcome/index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions, only:[:new, :create, :destroy]


  # get 'users/profile', to: 'users#profile'

  # resources :carts, only:[:show, :index, :new, :create, :edit, :update]
  # resources :categories, only:[:show]
  # resources :items, only:[:show]
  # resources :comments, only:[:new, :create, :destroy]

end