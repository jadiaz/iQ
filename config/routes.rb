IQ::Application.routes.draw do
  root :to => 'home#index'

  namespace :iq do
    root :to => 'home#index'
    resources :members
  end
  
  resources :sessions

  match 'sign_in' => 'sessions#new', :as => :sign_in
  match 'sign_out' => 'sessions#destroy', :as => :sign_out
end
