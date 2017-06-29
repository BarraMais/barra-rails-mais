class EventGuest < ApplicationRecord
  before_save :initialize_status
  belongs_to :guest, class_name: 'User'
  belongs_to :event
  enum status: [:pending, :accept, :refuse]
  validates :guest, uniqueness: {scope: :event_id}

  def initialize_status
    self.status = :pending if self.status.nil?
  end

end
