require 'rails_helper'

RSpec.describe "nautical_sports/new", type: :view do
  before(:each) do
    assign(:nautical_sport, NauticalSport.new())
  end

  it "renders new nautical_sport form" do
    render

    assert_select "form[action=?][method=?]", nautical_sports_path, "post" do
    end
  end
end
