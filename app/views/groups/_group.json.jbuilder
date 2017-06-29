json.extract! group, :id, :name, :about, :created_at, :updated_at
json.cover_photo_url asset_url(group.cover_photo.url)
json.admin group.user
json.members do
  json.array! group.members, partial: 'users/user', as: :user
end
