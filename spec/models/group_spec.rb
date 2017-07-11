require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { FactoryGirl.create :user }
  let(:valid_attributes) { FactoryGirl.attributes_for :valid_group, user_id: user.id }

  describe '#create' do
    context "with valid attributes" do
      it 'persists a group' do
        expect {
          group = Group.create valid_attributes
        }.to change{ Group.count }.by(1)

      end
    end
  end
end
