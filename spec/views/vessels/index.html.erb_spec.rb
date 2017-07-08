require 'rails_helper'

RSpec.describe "vessels/index", type: :view do
  before(:each) do
    assign(:vessels, [
      Vessel.create!(),
      Vessel.create!()
    ])
  end

  it "renders a list of vessels" do
    render
  end
end
