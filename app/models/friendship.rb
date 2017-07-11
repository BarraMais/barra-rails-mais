class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  before_create :initialize_status
  after_save :reflect_friendship
  after_destroy :reflect_unfriend

  enum status: [
    :pending,
    :accept,
    :refuse
  ]

  validates :friend, uniqueness: { scope: :user }

  private

  def initialize_status
    self.status ||= :pending
  end

  def reflect_friendship
    if accept? && !friend.friend_of?(user)
      friend.friends << user
      find_reflection.accept!
    end
  end

  def find_reflection
    Friendship.where(user: friend, friend: user).first
  end

  def reflect_unfriend
    friend.friends.delete user
  end
end
