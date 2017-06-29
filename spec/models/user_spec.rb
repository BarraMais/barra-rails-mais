require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_attributes) { FactoryGirl.attributes_for :user }

  describe '#create' do
    context "with valid attributes" do
      it 'persists a user' do
        expect {
          user = User.create valid_attributes
        }.to change{ User.count }.by(1)
      end
    end

    context "with invalid attributes" do
      xit 'doesnt persist user' do

      end
    end
  end

  describe '#create_post' do
    let(:user) { FactoryGirl.create :user }
    let(:valid_post) { FactoryGirl.attributes_for :valid_post }
    let(:invalid_post_text) { FactoryGirl.attributes_for :invalid_post }

    context 'with valid attributes' do
      it 'persists a comment' do
        post = user.create_post valid_post
        expect(post.persisted?).to be_truthy
      end
    end

    context 'with invalid attributes' do
      context 'without text' do
        it 'doesnt persists a coment' do
          post = user.create_post invalid_post_text
          expect(post.persisted?).to be_falsey
        end
      end
    end
  end
end
