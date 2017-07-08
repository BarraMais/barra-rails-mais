json.extract! photo, :id, :created_at, :updated_at
json.url asset_url(photo.image.url)