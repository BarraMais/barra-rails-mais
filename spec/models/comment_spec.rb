require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:post_owner) { FactoryGirl.create :user }
  let(:post) { FactoryGirl.create :valid_post, user: post_owner }
  let(:user) { FactoryGirl.create :user }
  let(:valid_attributes) { FactoryGirl.attributes_for :valid_comment }
  let(:invalid_attributes) { FactoryGirl.attributes_for :invalid_comment }

  describe '#save' do
    context 'with valid attributes' do
      it 'persists a comment' do
        comment = Comment.new valid_attributes
        comment.post = post
        comment.user = user
        expect(comment.save).to be_truthy
      end
    end

    context 'with invalid attributes' do
      it 'doesnt persists a coment' do
        comment = Comment.new invalid_attributes
        comment.post = post
        comment.user = user
        expect(comment.save).to be_falsey
      end
    end
  end
end
