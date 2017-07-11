json.extract! event, :id, :user_id, :name, :about, :event_date, :cover_photo_content_type, :cover_photo_file_name, :cover_photo_file_size, :cover_photo_updated_at, :created_at, :updated_at, :address
json.id event.id
json.user_id event.user_id
json.name event.name
json.cover_photo_url event.cover_photo.url
json.address event.address
json.state event.address.state
json.city event.address.city
