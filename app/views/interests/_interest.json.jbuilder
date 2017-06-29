json.extract! interest, :id, :name, :created_at, :updated_at
json.url interest_url(interest, format: :json)
json.photo_url asset_url(interest.photo.url)
