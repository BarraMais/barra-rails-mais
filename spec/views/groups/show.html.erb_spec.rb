require 'rails_helper'

RSpec.describe "groups/show", type: :view do
  let(:user) { FactoryGirl.create :user }

  let(:valid_attributes) { FactoryGirl.attributes_for :valid_group, user_id: user.id }

  before(:each) do
    @group = assign(:group, Group.create!(valid_attributes))
  end

  it "renders attributes in <p>" do
    render
  end
end
