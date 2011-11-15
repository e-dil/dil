Dil::Application.routes.draw do
  resources :letters do 
    resources :entries 
  end
  resources :terms 
  resources :words do 
    get 'search', :on => :collection
  end 

  match 'browse' => 'letters#index', :as => :browse
  match 'advanced' => 'letters#index', :as => :advanced
  match 'search' => 'words#search', :as => :search
  root :to => 'letters#index'
end
