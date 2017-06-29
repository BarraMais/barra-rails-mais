require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { FactoryGirl.create :user }
  let(:valid_attributes) { FactoryGirl.attributes_for :valid_post }
  let(:invalid_post_text) { FactoryGirl.attributes_for :invalid_post }

  describe '#create' do
    context 'with valid attributes' do
      it 'persists a comment' do
        post = Post.new valid_attributes
        post.user = user
        expect(post.save).to be_truthy
      end
    end

    context 'with invalid attributes' do
      context 'without text' do
        it 'doesnt persists a coment' do
          post = Post.new invalid_post_text
          post.user = user
          expect(post.save).to be_falsey
        end
      end
    end
  end
end
