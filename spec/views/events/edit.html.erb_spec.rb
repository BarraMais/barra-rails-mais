require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  let(:user) { FactoryGirl.create :user }
  let(:address) { FactoryGirl.create :address }

  let(:valid_attributes) { FactoryGirl.attributes_for :valid_event, user_id: user.id, address_id: address.id }

  before(:each) do
    @event = assign(:event, Event.create!(valid_attributes))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do
    end
  end
end
