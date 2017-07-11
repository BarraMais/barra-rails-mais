require 'rails_helper'

RSpec.describe EventGuest, type: :model do
  let(:user) { FactoryGirl.create :user }
  let(:event) { FactoryGirl.create :valid_event }
  let(:valid_attributes) { FactoryGirl.attributes_for :event_guest, user_id: user.id, event_id: event.id }

  describe '#create' do
    context "with valid attributes" do
      it 'persists a event_guest' do
        expect {
          event_guest = EventGuest.create valid_attributes
        }.to change{ EventGuest.count }.by(1)
      end
    end
  end 
end
