require 'rails_helper'

RSpec.describe "interest_areas/show", type: :view do
  before(:each) do
    @interest_area = assign(:interest_area, InterestArea.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
