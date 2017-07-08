require 'rails_helper'

RSpec.describe GroupMember, type: :model do
  let(:user) { FactoryGirl.create :user }
  let(:group) { FactoryGirl.create :valid_group }
  let(:valid_attributes) { FactoryGirl.attributes_for :group_member, user_id: user.id, group_id: group.id }

  describe '#create' do
    context "with valid attributes" do
      it 'persists a group_member' do
        expect {
          group_member = GroupMember.create valid_attributes
        }.to change{ GroupMember.count }.by(1)
      end
    end
  end
end
