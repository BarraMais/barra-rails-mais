class PhotosController < ApplicationController

	# GET with conditional
	def get_album_photo
		@photos = Photo.where(album_id: params[:id])
	end

	def create
	    @photo = Photo.new
	    @photo.album = params['album_id']
	    image = Paperclip.io_adapters.for(image_params[:image])
	    image.original_filename = "#{image_params[:filename]}"
	    @photo.image = image
	    @photo.save
	    # respond_to do |format|
	    #   if @album_photo.save
	    #     format.html { redirect_to @album_photo, notice: 'Album photo was successfully created.' }
	    #     format.json { render json: @album_photo }
	    #   else
	    #     format.html { render :new }
	    #     format.json { render json: @album_photo.errors, status: :unprocessable_entity }
	    #   end
	    # end
	end

end
