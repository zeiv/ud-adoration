Rails.application.routes.draw do

	#Caseadilla routes
	namespace :caseadilla do
		resources :time_slots
		resources :reminders
		resources :people
    get action: 'index', controller: 'home'
    get 'system_config', action: 'system_config', controller: 'home', as: 'system_config'
    delete 'disable_system', action:'disable_system', controller: 'home', as: 'disable_system'
    post 'enable_system', action:'enable_system', controller: 'home', as: 'enable_system'
    get 'email', action: 'email', controller: 'home', as: 'email'
    post 'send_email', action: 'send_email', controller: 'home', as: 'send_email'
	end

  resources :time_slots, only: [:destroy]

  devise_for :users
  root "caseadilla/caseadilla_user_sessions#new"


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
