class Post < ApplicationRecord
  include ActionView::Helpers::DateHelper
  belongs_to :user
  has_many :post_images, dependent: :destroy

  acts_as_votable
  acts_as_commentable

  validates :description, presence: true

  enum domain: [:profiles, :events, :groups, :pages]

  scope :with_domain, ->(domain, domain_id) {
    where(domain: domain, domain_id: domain_id).order(created_at: :desc)
  }

  def sent_date_format
    if created_at.today?
      time_ago_in_words(created_at)
    else
      created_at.strftime("%b, %d %Y - %H:%M")
    end
  end

  def self.for_feed(user)
    users_ids = [user.id] + user.friends.ids
    groups_ids = user.confirmed_groups_ids
    events_ids = user.confirmed_events.ids

    Post.where("user_id in (:users_ids)
    OR
    (domain = :event_domain AND domain_id in (:events_ids))
    OR
    (domain = :group_domain AND domain_id in (:groups_ids))",
    users_ids: users_ids,
    event_domain: 1,
    events_ids: events_ids,
    group_domain: 2,
    groups_ids: groups_ids).order(created_at: :desc)
  end

  def domain_instance
    klass = nil
    case domain
      when 'profiles'
        klass = User
      when 'events'
        klass = Event
      when 'groups'
        klass = Group
    end

    return klass.find(domain_id) unless klass.nil?
    logger.info "Class: #{klass}"
  end
end
