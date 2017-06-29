require 'rails_helper'

RSpec.describe "ads/show", type: :view do
  before(:each) do
    @ad = assign(:ad, Ad.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
