require 'rails_helper'

RSpec.describe "own_vessels/edit", type: :view do
  before(:each) do
    @own_vessel = assign(:own_vessel, OwnVessel.create!())
  end

  it "renders the edit own_vessel form" do
    render

    assert_select "form[action=?][method=?]", own_vessel_path(@own_vessel), "post" do
    end
  end
end
