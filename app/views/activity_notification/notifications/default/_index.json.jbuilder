json.extract! notification, :id

json.user User.find(notification.notifiable.user_id)
