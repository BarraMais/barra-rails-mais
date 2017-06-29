require 'rails_helper'

RSpec.describe "vessel_types/index", type: :view do
  before(:each) do
    assign(:vessel_types, [
      VesselType.create!(),
      VesselType.create!()
    ])
  end

  it "renders a list of vessel_types" do
    render
  end
end
