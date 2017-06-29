require 'rails_helper'

RSpec.describe "NauticalSports", type: :request do
  describe "GET /nautical_sports" do
    it "works! (now write some real specs)" do
      get nautical_sports_path
      expect(response).to have_http_status(200)
    end
  end
end
