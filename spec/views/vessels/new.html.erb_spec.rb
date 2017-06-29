require 'rails_helper'

RSpec.describe "vessels/new", type: :view do
  before(:each) do
    assign(:vessel, Vessel.new())
  end

  it "renders new vessel form" do
    render

    assert_select "form[action=?][method=?]", vessels_path, "post" do
    end
  end
end
