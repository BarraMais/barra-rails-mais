json.extract! photo, :id, :title, :created_at, :updated_at, :album_id
json.url asset_url(photo.image.url)
