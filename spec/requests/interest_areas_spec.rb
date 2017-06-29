require 'rails_helper'

RSpec.describe "InterestAreas", type: :request do
  describe "GET /interest_areas" do
    it "works! (now write some real specs)" do
      get interest_areas_path
      expect(response).to have_http_status(200)
    end
  end
end
