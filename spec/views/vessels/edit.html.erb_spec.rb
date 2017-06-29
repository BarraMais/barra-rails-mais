require 'rails_helper'

RSpec.describe "vessels/edit", type: :view do
  before(:each) do
    @vessel = assign(:vessel, Vessel.create!())
  end

  it "renders the edit vessel form" do
    render

    assert_select "form[action=?][method=?]", vessel_path(@vessel), "post" do
    end
  end
end
