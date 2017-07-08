require 'rails_helper'

RSpec.describe "accessories/new", type: :view do
  before(:each) do
    assign(:accessory, Accessory.new())
  end

  it "renders new accessory form" do
    render

    assert_select "form[action=?][method=?]", accessories_path, "post" do
    end
  end
end
