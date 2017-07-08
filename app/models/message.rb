class Message < ApplicationRecord
  # after_create :notify_users

  belongs_to :user
  belongs_to :conversation

  after_create_commit { MessageBroadcastJob.perform_later(self) }

  def sent_date_format
    if created_at.today?
      created_at.to_formatted_s :time
    elsif created_at.between?(1.week.ago, Date.current)
      created_at.strftime("%a")
    else
      created_at.strftime("%d %b")
    end
  end

  # # acts_as_notifiable configures your model as ActivityNotification::Notifiable
  # # with parameters as value or custom methods defined in your model as lambda or symbol
  # acts_as_notifiable :users,
  #   # Notification targets as :targets is a necessary option
  #   # Set to notify to author and users commented to the article, except comment owner self
  #   targets: ->(message, key) {
  #     ([message.conversation.sender]).uniq
  #   }
  #
  #   def notify_users
  #     notify :users
  #   end
end
