Rails.application.routes.draw do
root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users, only:[:index, :show, :new, :create, :delete]
get 'users/history', to: 'users#history'
resources :carts, only:[:show, :index, :new, :create, :edit, :update]
resources :categories, only:[:show]
resources :items, only:[:show]
resources :comments

end
