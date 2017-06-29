require 'rails_helper'

RSpec.describe "own_vessels/new", type: :view do
  before(:each) do
    assign(:own_vessel, OwnVessel.new())
  end

  it "renders new own_vessel form" do
    render

    assert_select "form[action=?][method=?]", own_vessels_path, "post" do
    end
  end
end
