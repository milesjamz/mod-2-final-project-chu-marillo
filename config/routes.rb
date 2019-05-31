Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  get 'welcome/index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  # get 'users', to: 'users#show', as: 'users'
  resources :users#, except: [:index]
  resources :sessions, only:[:new, :create, :destroy]
  resources :line_items

post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"

  get 'users/:id/profile', to: 'users#profile'

  resources :carts
  resources :categories, only:[:show]
  resources :items, only:[:show]
  resources :comments, only:[:new, :create, :destroy]

end
