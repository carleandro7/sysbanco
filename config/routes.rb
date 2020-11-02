Rails.application.routes.draw do
  devise_for :accounts , controllers: { 
    sessions: 'accounts/sessions'
  }
  devise_scope :accounts do
    get 'signin', to: 'accounts/sessions#new'
    get 'signout', to: 'accounts/registrations#destroy' 
  end
  resources :transferaccounts
  resources :transfers
  resources :saques
  resources :depositos
  resources :accounts, :path => "accounts" do
    collection do
      get "/menu"  => "accounts#menu", :as => "menu" 
      #get "/encerrarconta"  => "accounts#encerrarconta", :as => "encerrarconta" 
      #get "/extratoconta"  => "accounts#extratoconta", :as => "extratoconta" 
    end
  end
  root "accounts#menu"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
