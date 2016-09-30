Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :projects, only: [:index, :show] do
    resources :lessons, controller: 'project_lessons', only: [:index, :show]
    resources :uploads, controller: 'project_uploads'
  end
    
  resources :users do
    resources :participants
    resources :teams
  	member do
  		get :profile
    end
  end

  namespace :admin do
    root "dashboard#index"
    
    resources :users do
      collection do
        post :bulk_update
        post :import
      end
    end
    resources :projects do
      get :participants
      resources :stages, controller: 'project_stages'
      resources :lessons, controller: 'project_lessons', except: [:index]
      resources :tasks, controller: 'project_tasks'
      resources :assignments, controller: 'project_assignments', only: [:create, :update, :destroy]
      resources :uploads, controller: 'project_uploads'
    end
    resources :groups
    resources :teams, only: [:index]
  end

  root :to => 'projects#index'
end
