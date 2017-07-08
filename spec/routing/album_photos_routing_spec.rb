require "rails_helper"

RSpec.describe AlbumPhotosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/album_photos").to route_to("album_photos#index")
    end

    it "routes to #new" do
      expect(:get => "/album_photos/new").to route_to("album_photos#new")
    end

    it "routes to #show" do
      expect(:get => "/album_photos/1").to route_to("album_photos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/album_photos/1/edit").to route_to("album_photos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/album_photos").to route_to("album_photos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/album_photos/1").to route_to("album_photos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/album_photos/1").to route_to("album_photos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/album_photos/1").to route_to("album_photos#destroy", :id => "1")
    end

  end
end
