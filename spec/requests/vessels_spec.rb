require 'rails_helper'

RSpec.describe "Vessels", type: :request do
  describe "GET /vessels" do
    it "works! (now write some real specs)" do
      get vessels_path
      expect(response).to have_http_status(200)
    end
  end
end
