Rails.application.routes.draw do
root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users, only:[:index, :show, :new, :create, :delete]
get 'users/profile', to: 'users#profile'
get '/', to: 'sessions#create'
resources :carts, only:[:show, :index, :new, :create, :edit, :update]
# resources :categories, only:[:show]
resources :items, only:[:show]
resources :comments, only:[:new, :create, :delete]

end
