require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:city) { FactoryGirl.create :city }
  let(:state) { FactoryGirl.create :state }
  let(:country) { FactoryGirl.create :country }
  let(:valid_attributes) { FactoryGirl.attributes_for :address, city_id: city.id, state_id: state.id, country_id: country.id }

  describe '#create' do
    context "with valid attributes" do
      it 'persists a address' do
        expect {
          address = Address.create valid_attributes
        }.to change{ Address.count }.by(1)
      end
    end
  end
end
