json.extract! message, :id, :body, :conversation_id, :created_at, :updated_at
json.user do
  json.id message.user.id
  json.name "#{message.user.first_name} #{message.user.last_name}"
  json.avatar asset_url(message.user.avatar.url)
end
