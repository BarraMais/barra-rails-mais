json.extract! conversation, :id

opposed = conversation.opposed_user(current_user)
json.opposed do
  json.id opposed.id
  json.name "#{opposed.first_name} #{opposed.last_name}"
  json.avatar asset_url(opposed.avatar.url)
end

if last = conversation.last_message
  json.last_message do
    json.body last.body
    json.sent_date last.sent_date_format
  end
end
