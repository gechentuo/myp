Myp::Application.routes.draw do
  get "clas/create"
  get "clas/destroy"
  get "clas/update"

resources :users do
    member do
      get 'select_type'
      patch 'update_type'
      get 'select_school'
      get 'qschbyname', to: 'schools#search_by_name'
      get 'qschbylocation', to: 'schools#search_by_location'
    end
  end
  resources :sessions, only: [:new, :destroy, :create]
  resources :schools, only: [:new, :destroy, :create, :edit, :update ] do
	collection do
		get 'admin'
	end
	  member do	
		get 'adclas'
		get 'addem'
		get 'adbas'
		resource :demonstrate, path: '/admin/demonstrate'
  		resources :grades, path: '/admin/grades'
		resources :clas, path: '/admin/clas'
	  end
  end
  root to: "static_pages#home"

  

  mount ChinaCity::Engine=>'/china_city'

  match '/help', to: 'static_pages#help', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'

  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

end
