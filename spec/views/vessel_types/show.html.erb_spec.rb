require 'rails_helper'

RSpec.describe "vessel_types/show", type: :view do
  before(:each) do
    @vessel_type = assign(:vessel_type, VesselType.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
