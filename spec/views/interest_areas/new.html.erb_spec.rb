require 'rails_helper'

RSpec.describe "interest_areas/new", type: :view do
  before(:each) do
    assign(:interest_area, InterestArea.new())
  end

  it "renders new interest_area form" do
    render

    assert_select "form[action=?][method=?]", interest_areas_path, "post" do
    end
  end
end
