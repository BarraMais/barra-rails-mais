json.extract! comment, :id, :body, :parent_id, :created_at, :updated_at

json.sent_date_format comment.sent_date_format

json.commentator do
  json.user_id comment.user.id
  json.name "#{comment.user.first_name} #{comment.user.last_name}"
  json.avatar_url asset_url(comment.user.avatar.url)
end
