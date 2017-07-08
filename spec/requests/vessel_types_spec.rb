require 'rails_helper'

RSpec.describe "VesselTypes", type: :request do
  describe "GET /vessel_types" do
    it "works! (now write some real specs)" do
      get vessel_types_path
      expect(response).to have_http_status(200)
    end
  end
end
