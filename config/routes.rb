ExperimentalCenter::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  #devise_for :users
  namespace :admin do
    root :to => 'home#index'
    resources :notices do
      collection do
        get "pass"
        get "unpass"
      end
    end
    resources :site_requirements
    resources :devices
    resources :specifications
    resources :blogrolls
    resources :sites
    resources :users
    resources :rules
    resources :dorders do
      collection do
        get "pass"
        get "unpass"
        get "revert"
        put "return"
      end
    end
    resources :sorders do
      collection do
        get "pass"
        get "unpass"
        get "revert"
        put "return"
      end
    end
  end
  resources :sessions,only: [:new,:create,:destroy]
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  resources :dorders
  resources :sorders
  resources :notices,only: [:index,:show]
  resources :devices,only: [:index] do
    collection do
      get "list"
      get "download"
    end
  end
  resources :sites,only: [:index] do
    collection do
      get "requirement"
      end
  end
  resources :rules,only: [:index]

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
