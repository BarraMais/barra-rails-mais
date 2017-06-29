require 'rails_helper'

RSpec.describe "accessories/show", type: :view do
  before(:each) do
    @accessory = assign(:accessory, Accessory.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
