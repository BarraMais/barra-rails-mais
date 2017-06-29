json.extract! post, :id, :description, :created_at, :updated_at
json.sent_date_format post.sent_date_format
json.attached_image_url ""

json.user do
  json.user_id post.user.id
  json.name "#{post.user.first_name} #{post.user.last_name}"
  json.avatar_url asset_url(post.user.avatar.url)
end

json.comments do
  json.array! post.root_comments, partial: 'posts/comment', as: :comment
end

json.likes do
  json.size post.get_likes.size
  json.didILiked current_user.voted_for? post
end

json.post_images do
  if post.post_images.present?
    json.array!(post.post_images) do |post_image|
      json.post_image asset_url(post_image.image.url)
    end
  end
end

if post.rich_url.present?
  json.rich_url do
    rich = JSON.parse(post.rich_url.first)
    json.title rich['title']
    json.description rich['description']
    json.favicon rich['favicon']
    if rich['images'].present?
      json.images do
        json.array!(rich['images']) do |image|
          json.src image['src']
          json.size image['size']
          json.type image['type']
        end
      end
    end
    if rich['videos'].present?
      json.videos do
        json.array!(rich['videos']) do |video|
          json.embed_code video['embed_code']
        end
      end
    end

    json.url rich['url'] if rich['url'].present?
  end
end

json.domain_type post.domain
json.domain post.domain_instance.as_json

json.url post_url(post, format: :json)
