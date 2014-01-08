require "spec_helper"

describe Notebook::NotesController do
  describe "routing" do

    it "routes to #index" do
      get("/notebook/notes").should route_to("notebook/notes#index")
    end

    it "routes to #new" do
      get("/notebook/notes/new").should route_to("notebook/notes#new")
    end

    it "routes to #show" do
      get("/notebook/notes/1").should route_to("notebook/notes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/notebook/notes/1/edit").should route_to("notebook/notes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/notebook/notes").should route_to("notebook/notes#create")
    end

    it "routes to #update" do
      put("/notebook/notes/1").should route_to("notebook/notes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/notebook/notes/1").should route_to("notebook/notes#destroy", :id => "1")
    end

  end
end
