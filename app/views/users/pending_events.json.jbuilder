#json.extract! @events, :id, :user_id, :name, :address, :created_at, :updated_at
json.pending_events do
  json.array!(@events) do |event|
    json.extract! event, :id, :user_id, :name, :about, :event_date, :cover_photo_content_type, :cover_photo_file_name, :cover_photo_file_size, :cover_photo_updated_at, :created_at, :updated_at, :address
    json.id event.id
    json.user_id event.user_id
    json.name event.name
    json.address event.address
    json.state event.address.state
    json.cover_photo_url asset_url(event.cover_photo.url)
    json.city event.address.city
  end
end
