require 'rails_helper'

RSpec.describe "own_vessels/index", type: :view do
  before(:each) do
    assign(:own_vessels, [
      OwnVessel.create!(),
      OwnVessel.create!()
    ])
  end

  it "renders a list of own_vessels" do
    render
  end
end
