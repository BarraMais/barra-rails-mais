require 'rails_helper'

RSpec.describe "interest_areas/index", type: :view do
  before(:each) do
    assign(:interest_areas, [
      InterestArea.create!(),
      InterestArea.create!()
    ])
  end

  it "renders a list of interest_areas" do
    render
  end
end
