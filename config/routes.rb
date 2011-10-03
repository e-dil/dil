Dil::Application.routes.draw do
  resources :letters do 
    resources :entries 
  end
  resources :terms 
  resources :words 

  match 'browse' => 'letters#index', :as => :browse
  match 'advanced' => 'letters#index', :as => :advanced
  match 'search' => 'letters#index', :as => :search
  root :to => 'letters#index'
end
