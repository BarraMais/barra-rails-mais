class AlbumsController < ApplicationController
	before_action :set_album, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:create]

	def index
	   @albums = Album.all
	end

	# GET /albums/1
	# GET /albums/1.json
	def show
	end

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

	    alb = params['album']
      	img = alb['image']
	    #@album.photo = image

	    dados = []
	    status = 'inicio'
	    status_album = false
	    photo_capa = false
	    photo_message = ''
	    album_id = ''
	    photo = ''
	    
	    if @album.save
	    	album_id = @album.id
	    	status_album = true
	    	if img
                @photo = Photo.new
                @photo.image = img
                @photo.photo_album_cover = true
                @photo.album_id = @album.id
                if @photo.save
                  puts "ok salvo"
                  photo_capa = true
                  photo = @photo
                else
                  puts "erro"
                  photo_message = 'erro na hora de salvar a photo'
                end
            end
	    end
	    status = 'fim'
	    dados << {:status => status, :album => status_album, :album_id => album_id,:photo_cover => photo_capa, :photo_message => photo_message, :photo => photo}
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
    	# Use callbacks to share common setup or constraints between actions.
	    def set_album
	      @album = Album.find(params[:id])
	    end
		def album_params
	      params.require(:album).permit(
	        :title,
	      )
	    end
end
