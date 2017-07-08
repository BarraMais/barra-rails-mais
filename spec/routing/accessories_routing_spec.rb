require "rails_helper"

RSpec.describe AccessoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/accessories").to route_to("accessories#index")
    end

    it "routes to #new" do
      expect(:get => "/accessories/new").to route_to("accessories#new")
    end

    it "routes to #show" do
      expect(:get => "/accessories/1").to route_to("accessories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/accessories/1/edit").to route_to("accessories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/accessories").to route_to("accessories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/accessories/1").to route_to("accessories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/accessories/1").to route_to("accessories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/accessories/1").to route_to("accessories#destroy", :id => "1")
    end

  end
end
