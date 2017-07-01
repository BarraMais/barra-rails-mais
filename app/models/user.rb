class User < ApplicationRecord
  # TARGET FOR NOTIFICATIONS
  acts_as_target

  before_destroy :destroy_my_recipient_conversations

  # ASSOCIATIONS
  belongs_to :partner, class_name: User, optional: true

  has_one :advertiser, dependent: :destroy
  has_many :classifieds, dependent: :destroy

  has_many :groups, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :event_invitations, foreign_key: "guest_id", class_name: "EventGuest", dependent: :destroy
  has_many :group_invitations, foreign_key: "member_id", class_name: "GroupMember", dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :conversations, foreign_key: :sender_id, dependent: :destroy
  has_many :own_vessels, dependent: :destroy

  #FRIENDSHIP
  has_many :friendships, dependent: :destroy
  has_many :friends, :through => :friendships, dependent: :destroy
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id", dependent: :destroy
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user, dependent: :destroy
  has_many :user_nautical_sports, dependent: :destroy
  has_many :nautical_sports, :through => :user_nautical_sports, dependent: :destroy
  has_many :traveled_states, dependent: :destroy
  has_many :state_for_travels, :through => :traveled_states, dependent: :destroy
  has_many :traveled_countries, dependent: :destroy
  has_many :country_for_travels, :through => :traveled_countries, dependent: :destroy
  has_many :album_photos, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :user_interests, dependent: :destroy
  has_many :interests, :through => :user_interests, dependent: :destroy

  # VENDOR METHODS

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable, :omniauth_providers => [:facebook]

  acts_as_voter

  has_attached_file :avatar, styles: {
    medium: "300x300>",
    thumb: "100x100>"
  }, default_url: '/images/user.jpg'

  has_attached_file :cover_photo, styles: {
    medium: "300x300>",
    thumb: "100x100>"
  }, default_url: '/images/comum.png'

  # ENUMS
  enum relationship: [
    :solteiro,
    :relacionamento_serio,
    :casado,
    :relacionamento_aberto,
    :divorciado,
    :viuvo
  ]
  enum nautical_license: [
    :unlicensed,
    :motonauta,
    :arrais_amador,
    :mestre_amador,
    :capitao_amador,
    :sem_interesse
  ]
  enum naval_service_patent: [
    :civil,
    :marinheiro,
    :cabo,
    :terceiro_sargento,
    :segundo_sargento,
    :primeiro_sargento,
    :suboficial,
    :segundo_tenente,
    :primeiro_tenente,
    :capitao_tenente,
    :capitao_de_corveta,
    :capitao_de_fragata,
    :capitao_de_mar_e_guerra,
    :contra_almirante,
    :vice_almirante,
    :almirante_de_esquadra
  ]

  enum water_sport: [
    :kitesurf,
    :windsurf,
    :surfboard,
    :bodyboard,
    :caiaque,
    :standup,
    :paddle,
    :vela,
    :wakeboard,
    :remo,
    :canoa,
    :rafting,
    :outro
  ]


  # VALIDATIONS
  validates :email, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  }

  # validates :first_name, :last_name, presence: true == Removido solicitação UX
  validates :first_name, presence: true
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  devise :database_authenticatable, :validatable, password_length: 8..128
  # validate :single_word_last_name == Removido solicitação UX
  validate :single_word_first_name

  #SCOPES
  scope :all_by,      ->(event) {joins(:event_invitations).where(event_guests: {event_id: event.id})}
  scope :pending_by,  ->(event) {joins(:event_invitations).where(event_guests: {event_id: event.id, status: 0})}
  scope :accepted_by, ->(event) {joins(:event_invitations).where(event_guests: {event_id: event.id, status: 1})}
  scope :refused_by,  ->(event) {joins(:event_invitations).where(event_guests: {event_id: event.id, status: 2})}


  class << self
    def from_facebook4(auth)
      if exists?(email: auth['basic_info']['email'])
        find_by_email auth['basic_info']['email']
      else
        where(provider: 'facebook', uid: auth['login_response']['authResponse']['userID']).first_or_create do |user|
          user.email = auth['basic_info']['email']
          user.password = Devise.friendly_token[0,20]
          user.birthday = auth['basic_info']['birthday']
          user.first_name = auth['basic_info']['first_name']
          user.last_name = auth['basic_info']['last_name']
          user.avatar = auth['picture']['data']['url']
        end
      end
    end

    def from_omniauth(auth)
      if exists?(email: auth.info.email)
        find_by_email auth.info.email
      else
        where(provider: auth.provider, uid: uid).first_or_create do |user|
          user.email = auth.info.email
          user.password = Devise.friendly_token[0,20]
          user.first_name = auth.info.name.split(' ').first
          user.last_name = auth.info.name.split(' ').last
          user.avatar = auth.info.image
        end
      end
    end
  end


  def create_post(post_params)
    posts.create(post_params)
  end

  #Event Actions

  def confirmed_events
    Event.accepted_by(self)
  end

  def refused_events
    Event.refused_by(self)
  end

  def pending_events
    Event.pending_by(self)
  end

  def accept_event event
    event_invitations.where(event: event).first.accept!
  end

  def refuse_event event
    event_invitations.where(event: event).first.refuse!
  end

  #Group Actions

  #Eventos em que este usuário está na lista de membros com o status aceito
  def confirmed_groups
    GroupMember.where(member: self, status: 1).includes(:group).map { |f| f.group }
  end

  def confirmed_groups_ids
    GroupMember.where(member: self, status: 1).ids
  end

  #Eventos em que este usuário está na lista de membros com o status recusado
  def refused_groups
    GroupMember.where(member: self, status: 2).includes(:group).map { |f| f.group }
  end

  #Eventos em que este usuário está na lista de membros com o status pendente
  def pending_groups
    GroupMember.where(member: self, status: 0).includes(:group).map { |f| f.group }
  end

  #Aceitar convite do grupo passado por parametro
  def accept_group group
    group_invitations.where(group: group).first.accept!
  end

  #Recusar convite do grupo passado por parametro
  def refuse_group group
    group_invitations.where(group: group).first.destroy
  end

  #Conversations Actions
  def initiated_conversations
    conversations = Conversation.where("sender_id = :user_id OR recipient_id = :user_id", user_id: id).includes(:messages)
    conversations.sort { |c| c.last_message.created_at }
  end

  def is_participant? conversation
    conversation.sender == self || conversation.recipient == self
  end

  # FRIENDSHIP SEARCHES

  def accepted_friendships
    friends.where(friendships: { status: :accept })
  end

  def refused_friendships
    friends.where(friendships: { status: :refuse })
  end

  def pending_friendships
    Friendship.where(friend: self, status: :pending).map { |f| f.user }
  end

  def all_friends
    friends
  end

  # FRIENDSHIP ACTIONS

  def request_friendship_of friend
    friends << friend
  end

  def accept_friendship_of friend
    friendship_request_of(friend).accept!
  end

  def refuse_friendship_of friend
    friendship_request_of(friend).refuse!
  end

  def friend_of? user
    if friends.include?(user) && friendship_between(user).pending?
      "waiting"
    else
      friends.include?(user) && friendship_between(user).accept?
    end
  end

  def unfriend friend
    friends.destroy friend
  end

  def friendship_request_sent? user
    friends.include?(user) && friendship_between(user).pending?
  end

  def user_hash
    user_h ||= self.as_json
    #corrigir isso não está chamando o asse_url corretamente.
    user_h.merge!({avatar_url: ApplicationController.helpers.asset_url(avatar.url)})
    user_h.merge!({cover_photo_url: ApplicationController.helpers.asset_url(cover_photo.url)})
    user_h.merge!({nautical_license_name: nautical_license.to_s.humanize})
    user_h.merge!({naval_service_patent_name: naval_service_patent.to_s.humanize})
    user_h.merge!({relationship_name: relationship.to_s.humanize})
    own_vessels_hash = own_vessels.reload.map do |own_vessel|
      {id: own_vessel.vessel_type.id}.merge!({vessel_type_name: own_vessel.vessel_type.name, vessel_type_photo_url: own_vessel.vessel_type.photo.url})
    end
    user_h[:own_vessels] = own_vessels_hash
    user_h
  end

  def save_own_vessels(new_own_vessels_id)
    own_vessels.each do |ov|
      ov.destroy unless new_own_vessels_id.include?(ov.vessel_type_id)
    end
    new_own_vessels_id.each do |new_own_vessel_id|
      own_vessels.create(vessel_type_id: new_own_vessel_id)
    end
  end

  def is_member_of? group
    if group_invitations.where(group: group, status: "accept").first
      return true
    else
      return false
    end
  end

  def send_request_to? group
    if group_invitations.where(group: group, status: "pending", who_started: :myself).first
      return true
    else
      return false
    end
  end

  def i_was_invited_to? group
    if group_invitations.where(group: group, status: "pending", who_started: :group_member).first
      return true
    else
      return false
    end
  end

  def destroy_my_recipient_conversations
    conversations = Conversation.where(recipient_id: self.id).destroy_all
  end

  private

  def single_word_last_name
    if last_name.split.size > 1 || last_name =~ /\d/
      errors.add(:last_name, "deve conter apenas um nome e deve conter apenas letras")
    end
  end

  def single_word_first_name
    if first_name.split.size > 1 || first_name =~ /\d/
      errors.add(:first_name, "deve conter apenas um nome e deve conter apenas letras")
    end
  end

  def friendship_request_of friend
    Friendship.where(user: friend, friend: self).first
  end

  def friendship_between friend
    friendships.where(friend: friend).first
  end


end
