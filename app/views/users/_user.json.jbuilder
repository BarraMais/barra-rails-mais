json.extract! user, :id, :first_name, :last_name, :cellphone, :birthday, :sex,
                :nautical_professional, :academic_profile, :relationship,
                :about, :has_embarcation, :nautical_profession_description,
                :naval_service, :naval_service_patent, :created_at, :updated_at, :advertiser,
                :nautical_license, :has_nautical_license, :profession, :work, :nautical_tour,
                :fishing, :facebook, :instagram, :twitter, :linkedin, :website, :language,
                :mobile_operator, :alternative_email, :national_trips, :international_trips,
                :international_trips, :cruise_trips, :nautical_literature, :nautical_application,
                :nautical_brand, :fishing_tourist, :tourist_places, :water_sportsman, :fishing_type
json.isFriend current_user.friend_of? user
json.avatar_url asset_url(user.avatar.url)
json.cover_photo_url asset_url(user.cover_photo.url)
json.nautical_license_name user.nautical_license.to_s.humanize
json.naval_service_patent_name user.naval_service_patent.to_s.humanize
json.relationship_name user.relationship.to_s.humanize
