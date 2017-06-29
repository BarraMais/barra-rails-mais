#json.extract! @events, :id, :user_id, :name, :address, :created_at, :updated_at
json.my_refused_invitations do
  json.array!(@invitations) do |invitation|
    json.extract! invitation, :id, :created_at, :updated_at, :status
    json.guest invitation.guest
    json.event do
      json.extract! invitation.event, :id, :user_id, :name, :about, :event_date, :cover_photo_content_type, :cover_photo_file_name, :cover_photo_file_size, :cover_photo_updated_at, :created_at, :updated_at, :address
      json.id invitation.event.id
      json.user_id invitation.event.user_id
      json.name invitation.event.name
      json.cover_photo_url invitation.event.cover_photo.url
      json.address invitation.event.address
      json.state invitation.event.address.state
      json.city invitation.event.address.city
    end
  end
end
