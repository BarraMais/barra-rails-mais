class AlbumsController < ApplicationController
	before_action :authenticate_user!, only: [:create]

	def new
	    @album = Album.new
	end

	def edit
  	end

	# GET with conditional
	def get_user_album
		@albums = Album.where(user_id: params[:id])
	end

	def create
	    @album = Album.new
	    @album.user = current_user
	    image = Paperclip.io_adapters.for(photo_params[:image])
	    image.original_filename = "#{photo_params[:filename]}"
	    image.photo_album_cover = true
	    #@album.photo = image
	    @album.save
	    @album.save_photo_cover(image)
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

	def update
		respond_to do |format|
			if @album.update(album_params)
				format.html { redirect_to @album, notice: 'Album photo was successfully updated.' }
				format.json { render :show, status: :ok, location: @album }
			else
				format.html { render :edit }
				format.json { render json: @album.errors, status: :unprocessable_entity }
			end
		end
	end
end
