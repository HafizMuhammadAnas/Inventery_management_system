Rails.application.routes.draw do

	devise_for :users, controllers: {
		sessions: 'users/sessions',
		passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
	}
	resources :users do
		collection do
			patch :update_password
			post :import
		end
	end
  get 'hello/index'
	get 'reports/sales'
	get 'reports/revenue'
	resources :payments
	resources :orders do
		member do
			get 'payment'
			post 'save_payment'
		end
		collection do
			get :export
		end
	end
	root :to => 'dashboard#index'
	resources :products
	get "search", 	to:"products#search"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
