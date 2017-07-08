require 'rails_helper'

RSpec.describe "groups/index", type: :view do
  let(:user) { FactoryGirl.create :user }

  let(:valid_attributes) { FactoryGirl.attributes_for :valid_group, user_id: user.id }

  before(:each) do
    assign(:groups, [
      Group.create!(valid_attributes),
      Group.create!(valid_attributes)
    ])
  end

  it "renders a list of groups" do
    render
  end
end
