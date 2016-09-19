Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :projects do
    resources :stages do
      resources :tasks do
        resources :uploads
      end
    end
  end
    
  resources :users do
    resources :teams
  	member do
  		get :profile
    end
  end

  resources :participants


  root :to => 'projects#index'
end
