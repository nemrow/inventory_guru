MeatApp::Application.routes.draw do
  resources :users
  resources :companies
  resources :suppliers do
	  resources :products
	  resources :inventory, only: [:index, :create]
    resources :orders, only: [:index, :create]
    resources :supplier_order_days
	end
  resource :supplier_order_days, only: [:create]
  resources :orders
  resources :sessions
  root :to => 'static_pages#index'
  get 'signout' => 'sessions#destroy'
end
