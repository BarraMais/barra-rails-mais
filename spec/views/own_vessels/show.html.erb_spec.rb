require 'rails_helper'

RSpec.describe "own_vessels/show", type: :view do
  before(:each) do
    @own_vessel = assign(:own_vessel, OwnVessel.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
