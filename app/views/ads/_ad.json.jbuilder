json.extract! ad, :id, :description, :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at, :created_at, :updated_at
json.id ad.id
json.description ad.description
json.photo_url asset_url(ad.photo.url)
