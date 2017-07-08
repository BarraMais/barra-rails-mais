require 'rails_helper'

RSpec.describe City, type: :model do
  let(:state) { FactoryGirl.create :state }
  let(:valid_attributes) { FactoryGirl.attributes_for :city, state_id: state.id }

  describe '#create' do
    context "with valid attributes" do
      it 'persists a city' do
        expect {
          city = City.create valid_attributes
        }.to change{ City.count }.by(1)
      end
    end
  end
end
