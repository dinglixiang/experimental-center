ExperimentalCenter::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  root :to => 'home#index'

  #devise_for :users
  namespace :admin do
    root :to => 'home#index'
    resources :home do
      collection do
        get "chart"
      end
    end
    resources :notices do
      collection do
        get "pass"
        get "unpass"
        get "published_list"
        get "banned_list"
        get "search"
        get "all"
      end
    end
    resources :site_requirements
    resources :devices
    resources :specifications
    resources :blogrolls
    resources :sites
    resources :users
    resources :videos
    resources :rules
    resources :introductions
    resources :dorders do
      collection do
        get "returned_list"
        get "pass"
        get "unpass"
        get "revert"
        put "return"
        get "published_list"
        get "banned_list"
      end
    end
    resources :sorders do
      collection do
        get "returned_list"
        get "pass"
        get "unpass"
        get "revert"
        put "return"
        get "published_list"
        get "banned_list"
      end
    end
  end

  resources :sessions,only: [:new,:create,:destroy]
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  resources :videos
  resources :dorders
  resources :sorders
  resources :introductions
  resources :notices,only: [:index,:show] do
    collection do
      get "news"
    end
  end
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

  resources :environments,only: [:index] do
    collection do
      get "site_list"
    end
  end 
  resources :rules,only: [:index]
 

end
