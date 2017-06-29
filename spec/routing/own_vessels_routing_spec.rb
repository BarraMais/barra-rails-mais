require "rails_helper"

RSpec.describe OwnVesselsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/own_vessels").to route_to("own_vessels#index")
    end

    it "routes to #new" do
      expect(:get => "/own_vessels/new").to route_to("own_vessels#new")
    end

    it "routes to #show" do
      expect(:get => "/own_vessels/1").to route_to("own_vessels#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/own_vessels/1/edit").to route_to("own_vessels#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/own_vessels").to route_to("own_vessels#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/own_vessels/1").to route_to("own_vessels#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/own_vessels/1").to route_to("own_vessels#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/own_vessels/1").to route_to("own_vessels#destroy", :id => "1")
    end

  end
end
