Grabnote::Application.routes.draw do
  resources :notebooks

  resource :dashboard, :only => :show
  
  devise_for :users

  namespace :users, :as => "user" do
    resource :settings, :only => [:edit, :update]
  end

  get "home/index"

  root 'dashboards#show'
end
