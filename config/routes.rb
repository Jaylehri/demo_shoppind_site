Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  get 'welcome/index'
  get 'sellers/seller'
  get 'line_items/addtocart'
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
