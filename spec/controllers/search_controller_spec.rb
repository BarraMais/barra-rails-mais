require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  describe "GET #look_for" do
    it "returns http success" do
      get :look_for
      expect(response).to have_http_status(:success)
    end
  end

end
