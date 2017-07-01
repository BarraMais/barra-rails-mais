class Album < ApplicationRecord
	belongs_to :user
	has_many :photos, dependent: :destroy

	def save_photo_cover(image)
		photo = Photo.new
		photo.image = image
		photo.save
	end
end
