require 'rails_helper'

RSpec.describe "vessels/show", type: :view do
  before(:each) do
    @vessel = assign(:vessel, Vessel.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
