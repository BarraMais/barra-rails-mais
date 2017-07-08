require 'rails_helper'

RSpec.describe "Accessories", type: :request do
  describe "GET /accessories" do
    it "works! (now write some real specs)" do
      get accessories_path
      expect(response).to have_http_status(200)
    end
  end
end
