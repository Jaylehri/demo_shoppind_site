Rails.application.routes.draw do
  

  resources :carts
  get 'orders/place_order'
  # post "/line_items"
  resources :orders  do 
    resources :line_items, except: [:index]
  end
 
  resources :line_items, only: [:index]
  resources :products  
  devise_for :users
  # post "/orders/place_order"
  #post "/line_items/new"

  root 'welcome#index'
  get 'welcome/index'
  get 'sellers/seller'
   
 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
