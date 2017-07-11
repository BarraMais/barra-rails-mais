require 'rails_helper'

RSpec.describe "ads/edit", type: :view do
  before(:each) do
    @ad = assign(:ad, Ad.create!())
  end

  it "renders the edit ad form" do
    render

    assert_select "form[action=?][method=?]", ad_path(@ad), "post" do
    end
  end
end
