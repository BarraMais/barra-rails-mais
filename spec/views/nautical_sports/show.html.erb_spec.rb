require 'rails_helper'

RSpec.describe "nautical_sports/show", type: :view do
  before(:each) do
    @nautical_sport = assign(:nautical_sport, NauticalSport.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
