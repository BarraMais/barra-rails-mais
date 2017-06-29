require 'rails_helper'

RSpec.describe "vessel_types/edit", type: :view do
  before(:each) do
    @vessel_type = assign(:vessel_type, VesselType.create!())
  end

  it "renders the edit vessel_type form" do
    render

    assert_select "form[action=?][method=?]", vessel_type_path(@vessel_type), "post" do
    end
  end
end
