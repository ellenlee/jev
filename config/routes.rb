Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :projects do
    resources :stages # 列出專案下各工作階段
    resources :tasks # 列出專案下所有預定工作成果
    resources :uploads # 列出專案下所有已繳交的成果
  end
    
  resources :users do
    resources :participants
    resources :teams
  	member do
  		get :profile
    end
  end

  


  root :to => 'projects#index'
end
