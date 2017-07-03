class Album < ApplicationRecord
	belongs_to :user
	has_many :photos, dependent: :destroy
	accepts_nested_attributes_for :photos

	#def save_photo_cover(image)
		#photo = Photo.new
		#photo.image = image
		#photo.save
	#end

	def save_photo_cover(photo_params)
	    photos.create(photo_params)
	end
end
