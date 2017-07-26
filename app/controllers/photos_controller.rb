class PhotosController < ApplicationController
	before_action :set_photo, only: [:show, :edit, :update, :destroy, :update_photo_album_cover]
	before_action :authenticate_user!, only: [:create]
	# GET /photos
	# GET /photos.json
	def index
	@photos = Photo.all
	end

	# GET /photos/1
	# GET /photos/1.json
	def show
	end

	# GET /photos/new
	def new
	@photo = Photo.new
	end

	# GET /photos/1/edit
	def edit
	end
	# GET with conditional
	def get_album_photo
		@photos = Photo.where(album_id: params[:id], photo_album_cover: false)
	end

	def create

		dados = []
		status = 'inicio'
		count_image_save = 0
		count_image_not_save = 0
		album_id = ''

	    params[:photo][:images].each do |im|
	    	puts "$"*100
	    	puts " original_filename = #{im['original_filename']}"
	    	#puts im.filename
	    	puts "$"*100
			@photo = Photo.new
			img = Paperclip.io_adapters.for(im['image'])
			img.original_filename = "#{im['original_filename']}"
			# img = Paperclip.io_adapters.for(im.url)
			# img.original_filename = "#{im.filename}"
			@photo.image = img
			@photo.album_id = photo_params[:album_id]
			album_id = photo_params[:album_id]
			if @photo.save
				count_image_save += 1
			else
				count_image_save += 1
			end
	    end

		status = 'fim'

		dados << {:status => status, :count_image_save => count_image_save, :count_image_not_save => count_image_not_save,:album_id => album_id}
		render :json => dados

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
			if @photo.update(photo_params)
				format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
				format.json { render :show, status: :ok, location: @photo }
			else
				format.html { render :edit }
				format.json { render json: @photo.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /photos/1
	# DELETE /photos/1.json
	def destroy
		dados = []
		if @photo.destroy
            message = "photo deletado com sucesso"
            status = "ok"
        else
            message = "problema para deletar photo >> photo.id = #{@photo.id}"
            status = "não deletado"
        end
        dados << {:status => status, :message => message}
        render :json => dados
	end

	def update_photo_album_cover
		dados = []
	    status = 'inicio'
	    photo_capa = false
	    photo_id = ''
	    photo = ''
	    photo_message = ''

		@photos_album = Photo.where(update_photo_album_cover[:album_id] )
		if @photos_album.update_attributes(:photo_album_cover => false)
			@photo = Photo.find(update_photo_album_cover[:photo_id])
			if @photo.update_attributes(:photo_album_cover => true)
				photo_capa = true
				photo_message = 'photo de capa alterado com sucesso'
				photo = @photo
			end
		end

		status = 'fim'
	    dados << {:status => status, :photo_cover => photo_capa, :photo_message => photo_message, :photo => photo}
	    render :json => dados

	end

  	private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_photo
	      @photo = Photo.find(params[:id])
	    end

	    def update_photo_album_cover
			params.require(:photo).permit(
				:photo_id,
				:album_id
			)
	    end

		def photo_params
	      params.require(:photo).permit(
	        :images,
	        :filename,
        	:album_id
	      )
	    end
end
