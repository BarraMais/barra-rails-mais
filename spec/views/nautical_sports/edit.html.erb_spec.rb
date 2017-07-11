require 'rails_helper'

RSpec.describe "nautical_sports/edit", type: :view do
  before(:each) do
    @nautical_sport = assign(:nautical_sport, NauticalSport.create!())
  end

  it "renders the edit nautical_sport form" do
    render

    assert_select "form[action=?][method=?]", nautical_sport_path(@nautical_sport), "post" do
    end
  end
end
