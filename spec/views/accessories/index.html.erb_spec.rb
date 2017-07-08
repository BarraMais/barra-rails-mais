require 'rails_helper'

RSpec.describe "accessories/index", type: :view do
  before(:each) do
    assign(:accessories, [
      Accessory.create!(),
      Accessory.create!()
    ])
  end

  it "renders a list of accessories" do
    render
  end
end
