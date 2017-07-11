require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { FactoryGirl.create :user }
  let(:address) { FactoryGirl.create :address }
  let(:valid_attributes) { FactoryGirl.attributes_for :valid_event, user_id: user.id, address_id: address.id }

  describe '#create' do
    context "with valid attributes" do
      it 'persists a event' do
        expect {
          event = Event.create valid_attributes
        }.to change{ Event.count }.by(1)
      end
    end
  end
end
