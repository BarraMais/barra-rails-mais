json.extract! notification, :id, :created_at, :group_id, :group_owner_id, :group_type, :key, :notifiable_id,
                            :notifiable_type, :notifier_id, :notifier_type, :opened_at, :target_id, :target_type,
                            :updated_at

json.target do
  json.partial! "users/user", user: notification.target
end

if notification.notifiable
  json.notifiable do
    json.extract! notification.notifiable, :body, :commentable_id, :commentable_type, :created_at, :id, :lft, :parent_id, :rgt, :subject,
    :title, :updated_at, :user_id
  end
end

if notification.notifiable
  json.notifiable_user do
    json.partial! "users/user", user: notification.notifiable.user
  end
end

if notification.created_at.today?
  json.sent_date_format "a " + time_ago_in_words(notification.created_at)
else
  json.sent_date_format "em " + notification.created_at.strftime("%b, %d %Y - %H:%M")
end
