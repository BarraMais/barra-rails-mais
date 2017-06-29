json.extract! comment, :id, :body, :commentable, :user_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
