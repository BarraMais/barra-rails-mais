require 'rails_helper'

RSpec.describe "interests/show", type: :view do
  before(:each) do
    @interest = assign(:interest, Interest.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
