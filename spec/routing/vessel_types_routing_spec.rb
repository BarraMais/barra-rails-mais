require "rails_helper"

RSpec.describe VesselTypesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/vessel_types").to route_to("vessel_types#index")
    end

    it "routes to #new" do
      expect(:get => "/vessel_types/new").to route_to("vessel_types#new")
    end

    it "routes to #show" do
      expect(:get => "/vessel_types/1").to route_to("vessel_types#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/vessel_types/1/edit").to route_to("vessel_types#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/vessel_types").to route_to("vessel_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/vessel_types/1").to route_to("vessel_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/vessel_types/1").to route_to("vessel_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/vessel_types/1").to route_to("vessel_types#destroy", :id => "1")
    end

  end
end
