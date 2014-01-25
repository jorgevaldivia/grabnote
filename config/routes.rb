Grabnote::Application.routes.draw do

  resources :projects do
    resources :comments, only: [:create, :destroy], controller: "project/comments"
  end

  resources :notebooks do
    resources :notes, controller: "notebook/notes"
  end

  resource :dashboard, :only => :show
  
  devise_for :users, controllers: {omniauth_callbacks: "authentications", registrations: "registrations"}

  namespace :users, :as => "user" do
    resource :settings, :only => [:edit, :update]
    resource :passwords, :only => [:edit, :update]
  end

  get "home/index"

  root 'dashboards#show'
end
