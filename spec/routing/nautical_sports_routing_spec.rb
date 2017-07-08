require "rails_helper"

RSpec.describe NauticalSportsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/nautical_sports").to route_to("nautical_sports#index")
    end

    it "routes to #new" do
      expect(:get => "/nautical_sports/new").to route_to("nautical_sports#new")
    end

    it "routes to #show" do
      expect(:get => "/nautical_sports/1").to route_to("nautical_sports#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/nautical_sports/1/edit").to route_to("nautical_sports#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/nautical_sports").to route_to("nautical_sports#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/nautical_sports/1").to route_to("nautical_sports#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/nautical_sports/1").to route_to("nautical_sports#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/nautical_sports/1").to route_to("nautical_sports#destroy", :id => "1")
    end

  end
end
