class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :cellphone, :birthday, :sex,
             :nautical_professional, :academic_profile, :relationship, :about,
             :has_embarcation, :nautical_profession_description, :naval_service,
             :created_at, :updated_at

  has_one :partner, class_name: User, optional: true
end
