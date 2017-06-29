require 'rails_helper'

RSpec.describe "interest_areas/edit", type: :view do
  before(:each) do
    @interest_area = assign(:interest_area, InterestArea.create!())
  end

  it "renders the edit interest_area form" do
    render

    assert_select "form[action=?][method=?]", interest_area_path(@interest_area), "post" do
    end
  end
end
