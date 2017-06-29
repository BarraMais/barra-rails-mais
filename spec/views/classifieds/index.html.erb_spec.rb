require 'rails_helper'

RSpec.describe "classifieds/index", type: :view do
  before(:each) do
    assign(:classifieds, [
      Classified.create!(),
      Classified.create!()
    ])
  end

  it "renders a list of classifieds" do
    render
  end
end
