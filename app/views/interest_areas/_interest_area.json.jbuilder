json.extract! interest_area, :id, :created_at, :updated_at
json.url interest_area_url(interest_area, format: :json)
json.photo_url asset_url(interest_area.photo.url)
