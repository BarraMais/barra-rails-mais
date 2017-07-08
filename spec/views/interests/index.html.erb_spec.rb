require 'rails_helper'

RSpec.describe "interests/index", type: :view do
  before(:each) do
    assign(:interests, [
      Interest.create!(),
      Interest.create!()
    ])
  end

  it "renders a list of interests" do
    render
  end
end
