class GroupMember < ApplicationRecord
  before_save :initialize_status
  belongs_to :member, class_name: 'User'
  belongs_to :group
  enum status: [:pending, :accept, :refuse]
  enum who_started: [:myself, :group_member]
  validates :member, uniqueness: {scope: :group_id}

  def initialize_status
    self.status = :pending if self.status.nil?
  end

end
