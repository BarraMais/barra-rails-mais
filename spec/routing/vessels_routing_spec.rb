require "rails_helper"

RSpec.describe VesselsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/vessels").to route_to("vessels#index")
    end

    it "routes to #new" do
      expect(:get => "/vessels/new").to route_to("vessels#new")
    end

    it "routes to #show" do
      expect(:get => "/vessels/1").to route_to("vessels#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/vessels/1/edit").to route_to("vessels#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/vessels").to route_to("vessels#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/vessels/1").to route_to("vessels#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/vessels/1").to route_to("vessels#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/vessels/1").to route_to("vessels#destroy", :id => "1")
    end

  end
end
