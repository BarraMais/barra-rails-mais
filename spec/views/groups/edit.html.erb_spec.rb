require 'rails_helper'

RSpec.describe "groups/edit", type: :view do
  let(:user) { FactoryGirl.create :user }

  let(:valid_attributes) { FactoryGirl.attributes_for :valid_group, user_id: user.id }

  before(:each) do
    @group = assign(:group, Group.create!(valid_attributes))
  end

  it "renders the edit group form" do
    render

    assert_select "form[action=?][method=?]", group_path(@group), "post" do
    end
  end
end
