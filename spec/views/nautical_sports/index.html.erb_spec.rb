require 'rails_helper'

RSpec.describe "nautical_sports/index", type: :view do
  before(:each) do
    assign(:nautical_sports, [
      NauticalSport.create!(),
      NauticalSport.create!()
    ])
  end

  it "renders a list of nautical_sports" do
    render
  end
end
