require 'rails_helper'

RSpec.describe "events/show", type: :view do
  let(:user) { FactoryGirl.create :user }
  let(:address) { FactoryGirl.create :address }

  let(:valid_attributes) { FactoryGirl.attributes_for :valid_event, user_id: user.id, address_id: address.id }

  before(:each) do
    @event = assign(:event, Event.create!(valid_attributes))
  end

  it "renders attributes in <p>" do
    render
  end
end
