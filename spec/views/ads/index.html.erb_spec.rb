require 'rails_helper'

RSpec.describe "ads/index", type: :view do
  before(:each) do
    assign(:ads, [
      Ad.create!(),
      Ad.create!()
    ])
  end

  it "renders a list of ads" do
    render
  end
end
