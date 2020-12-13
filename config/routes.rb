Rails.application.routes.draw do
  resources :carts
  
  resources :products do
    resources :line_items
  end
  devise_for :users

  #post "/line_items/new"
  root 'welcome#index'
  get 'welcome/index'
  get 'sellers/seller'
   
  get 'orders/place_order'
 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
