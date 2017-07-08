class Event < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_many :event_guests, dependent: :destroy
  has_many :guests, through: :event_guests

  validates :name, :event_date, :about, presence: true

  has_attached_file :cover_photo, styles: { large: "1368x500>", medium: "800x400>", small: "500x300>" }, default_url: '/images/eventos.png'
  validates_attachment_content_type :cover_photo, content_type: /\Aimage\/.*\z/

  # scope :accepted_by, -> (user) {join_to_user(user).where(event_guests: {status: :accept})}
  # scope :refused_by,  -> (user) {join_to_user(user).where(event_guests: {status: :refuse})}
  # scope :pending_by,  -> (user) {join_to_user(user).where(event_guests: {status: :pending})}

  scope :accepted_by, -> (user) {join_to_user.where(event_guests: {guest_id: user.id, status: :accept})}
  scope :refused_by,  -> (user) {join_to_user.where(event_guests: {guest_id: user.id, status: :refuse})}
  scope :pending_by,  -> (user) {join_to_user.where(event_guests: {guest_id: user.id, status: :pending})}

  def confirmed_guests
    User.accepted_by(self)
  end

  def refused_guests
    User.refused_by(self)
  end

  def pending_guests
    User.pending_by(self)
  end

  def all_guests
    User.all_by(self)
  end

  private

  # def self.join_to_user user
  #   joins(:event_guests, :user).where(users: {id: user.id})
  # end

  def self.join_to_user
    joins(:event_guests)
  end


  # validates_date :event_date, on_or_after: Date.today, on: :create
end
