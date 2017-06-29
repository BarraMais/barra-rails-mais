json.array!(@post_likes) do |post_like|
  json.partial! "users/user", user: post_like.voter
end
