json.user_advertiser do
  if @user.advertiser != nil
    json.extract! @user.advertiser, :id, :document_type, :document_number, :email, :website, :facebook, :instagram, :user_id, :landline, :cell_phone, :created_at, :updated_at
    json.address @user.advertiser.address
    json.state @user.advertiser.address.state
    json.city @user.advertiser.address.city

    json.ads do
      json.array!(@user.advertiser.ads.order("created_at DESC")) do |ad|
        json.extract! ad, :id, :description, :created_at, :updated_at, :area
        json.photo_url ad.photo.url

        json.interest_areas do
          json.array!(ad.interest_areas) do |interest_area|
            json.extract! interest_area, :id, :name
            json.photo_url interest_area.photo.url
          end
        end
      end
    end
  end
end
