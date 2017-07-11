require 'rails_helper'

RSpec.describe "accessories/edit", type: :view do
  before(:each) do
    @accessory = assign(:accessory, Accessory.create!())
  end

  it "renders the edit accessory form" do
    render

    assert_select "form[action=?][method=?]", accessory_path(@accessory), "post" do
    end
  end
end
