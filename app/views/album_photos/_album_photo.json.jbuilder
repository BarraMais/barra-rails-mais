json.extract! album_photo, :id, :created_at, :updated_at
json.url asset_url(album_photo.photo.url)
