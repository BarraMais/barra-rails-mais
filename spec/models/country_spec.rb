require 'rails_helper'

RSpec.describe Country, type: :model do
  let(:valid_attributes) { FactoryGirl.attributes_for :country }

  describe '#create' do
    context "with valid attributes" do
      it 'persists a country' do
        expect {
          country = Country.create valid_attributes
        }.to change{ Country.count }.by(1)
      end
    end
  end
end
