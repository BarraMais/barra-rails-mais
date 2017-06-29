require 'rails_helper'

RSpec.describe "classifieds/new", type: :view do
  before(:each) do
    assign(:classified, Classified.new())
  end

  it "renders new classified form" do
    render

    assert_select "form[action=?][method=?]", classifieds_path, "post" do
    end
  end
end
