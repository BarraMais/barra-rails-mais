require "rails_helper"

RSpec.describe InterestAreasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/interest_areas").to route_to("interest_areas#index")
    end

    it "routes to #new" do
      expect(:get => "/interest_areas/new").to route_to("interest_areas#new")
    end

    it "routes to #show" do
      expect(:get => "/interest_areas/1").to route_to("interest_areas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/interest_areas/1/edit").to route_to("interest_areas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/interest_areas").to route_to("interest_areas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/interest_areas/1").to route_to("interest_areas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/interest_areas/1").to route_to("interest_areas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/interest_areas/1").to route_to("interest_areas#destroy", :id => "1")
    end

  end
end
