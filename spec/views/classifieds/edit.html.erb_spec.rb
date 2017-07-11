require 'rails_helper'

RSpec.describe "classifieds/edit", type: :view do
  before(:each) do
    @classified = assign(:classified, Classified.create!())
  end

  it "renders the edit classified form" do
    render

    assert_select "form[action=?][method=?]", classified_path(@classified), "post" do
    end
  end
end
