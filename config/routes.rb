Grabnote::Application.routes.draw do
  resource :dashboard, :only => :show
  
  devise_for :users

  namespace :users, :as => "user" do
    resource :settings, :only => [:edit, :update]
  end

  get "home/index"

  root 'dashboards#show'
end
