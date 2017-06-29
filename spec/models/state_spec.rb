require 'rails_helper'

RSpec.describe State, type: :model do
  let(:country) { FactoryGirl.create :country }
  let(:valid_attributes) { FactoryGirl.attributes_for :city, country_id: country.id }

  describe '#create' do
    context "with valid attributes" do
      it 'persists a state' do
        expect {
          state = State.create valid_attributes
        }.to change{ State.count }.by(1)
      end
    end
  end
end
