Rails.application.routes.draw do
	devise_for :users, controllers: {
		sessions: 'users/sessions',
		passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
	}
	resource :user, only: [:edit] do
		collection do
			patch 'update_password'
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
	end
	root :to => 'products#index'
	resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
