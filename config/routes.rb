Rails.application.routes.draw do
  
  resources :carts
  get 'orders/total_revanue'
  get "/orders/select_payment_mode"
  resources :orders  do 
    resources :line_items, except: [:index,:update, :destroy]
  end
  resources :line_items, only: [:index]
  resources :products do
    resources :line_items, only: [:destroy, :update]
  end
  devise_for :users
  post "/orders/place_order"
  # post 'products/product_id/line_items/id'
  root 'products#index'
  get 'welcome/index'
  get 'sellers/seller'
 get '/search' => 'products#search', :as => 'search_page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

