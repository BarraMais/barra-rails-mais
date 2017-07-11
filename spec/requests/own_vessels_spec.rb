require 'rails_helper'

RSpec.describe "OwnVessels", type: :request do
  describe "GET /own_vessels" do
    it "works! (now write some real specs)" do
      get own_vessels_path
      expect(response).to have_http_status(200)
    end
  end
end
