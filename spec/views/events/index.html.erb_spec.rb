require 'rails_helper'

RSpec.describe "events/index", type: :view do

  let(:user) { FactoryGirl.create :user }
  let(:address) { FactoryGirl.create :address }

  let(:valid_attributes) { FactoryGirl.attributes_for :valid_event, user_id: user.id, address_id: address.id }

  before(:each) do
    assign(:events, [
      Event.create!(valid_attributes),
      Event.create!(valid_attributes)
    ])
  end

  it "renders a list of events" do
    render
  end
end
