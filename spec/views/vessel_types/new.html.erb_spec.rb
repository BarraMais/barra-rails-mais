require 'rails_helper'

RSpec.describe "vessel_types/new", type: :view do
  before(:each) do
    assign(:vessel_type, VesselType.new())
  end

  it "renders new vessel_type form" do
    render

    assert_select "form[action=?][method=?]", vessel_types_path, "post" do
    end
  end
end
