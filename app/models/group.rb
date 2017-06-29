class Group < ApplicationRecord
  belongs_to :user
  has_many :group_members, dependent: :destroy
  has_many :members, through: :group_members

  validates :name, presence: true

  has_attached_file :cover_photo, styles: { large: "1368x500>", medium: "800x400>", small: "500x300>" }, default_url: '/images/grupo.png'
  validates_attachment_content_type :cover_photo, content_type: /\Aimage\/.*\z/

  #Todos os membros confirmados deste grupo
  def confirmed_members
    members.where(group_members: {status: 1})
  end
  #Todos os membros pendentes de aceitação do admin deste grupo
  def pending_by_user
    members.where(group_members: {status: 0, who_started: 1})
  end
  #Todos os membros pendentes de aceitação do admin deste grupo
  def pending_by_admin
    members.where(group_members: {status: 0, who_started: 0})
  end
  #Todos os membros que rejeitaram o convite deste grupo
  def refused_members
    members.where(group_members: {status: 2})
  end

  def all_members
    members
  end

end
