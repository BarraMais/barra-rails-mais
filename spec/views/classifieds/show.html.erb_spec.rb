require 'rails_helper'

RSpec.describe "classifieds/show", type: :view do
  before(:each) do
    @classified = assign(:classified, Classified.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
