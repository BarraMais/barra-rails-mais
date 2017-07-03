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
	    #image = Paperclip.io_adapters.for(album_params[:image])
	    #image.original_filename = "#{photo_params[:filename]}"
	    #image.photo_album_cover = true
	    #@album.photo = image
	    #@album.save
	    respond_to do |format|
        if @album.save
            @album.photos.create(album_params[:photos_attributes])
        end
      end
	    #@album.save_photo_cover(image)
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

	private

    def album_params
      params.require(:album).permit(
        :title,
        photos_attributes: [:image]
      )
    end
end
