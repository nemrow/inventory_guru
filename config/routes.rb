MeatApp::Application.routes.draw do
  resources :users
  resources :companies
  resources :suppliers do
	  resources :products
	  resources :inventory, only: [:index, :create]
    resources :orders, only: [:index, :create, :destroy]
    resources :order_days
    resources :deliveries, only: [:index]
	end
  resource :order_days, only: [:create]
  resources :orders
  resources :sessions
  root :to => 'static_pages#index'
  get 'signout' => 'sessions#destroy'
end
