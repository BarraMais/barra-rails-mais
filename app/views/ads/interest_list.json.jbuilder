json.interest_list do
  json.array!(@interest_areas) do |interest_area|
    json.extract! interest_area, :id, :name, :created_at, :updated_at
    json.url interest_area_url(interest_area, format: :json)
    json.photo_url asset_url(interest_area.photo.url)
  end
end
