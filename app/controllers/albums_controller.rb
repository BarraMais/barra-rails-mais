class AlbumsController < ApplicationController
	before_action :set_album, only: [:show, :edit, :update, :destroy]
	#before_action :authenticate_user!, only: [:create, ]
    skip_before_filter :verify_authenticity_token

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
		#@albums = Album.where(user_id: params[:id])
		@photos = Photo.select("albums.*, photos.*")
		.joins("left join albums on albums.id = photos.album_id")
		.where("albums.user_id" => params[:id], 'photos.photo_album_cover' => true)

		@photos.each do |photo|
			photo.id = photo.album_id
		end

	end

	def create
	    @album = Album.new

	    @album.user = current_user
	    @album.title = album_params[:title]
	    alb = params['album']
      	#img = alb['image']
      	img = Paperclip.io_adapters.for(album_params[:image])
		img.original_filename = "#{album_params[:original_filename]}"
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
		dados = []
	    status = 'inicio'
	    status_album = false
	    photo_capa = false
	    photo_message = ''
	    album_id = ''
	    photo = ''
		if @album.update_attributes(:title => album_params[:title])
			album_id = @album.id
			status_album = true
			if album_params[:img]
				img = Paperclip.io_adapters.for(album_params[:img])
				img.original_filename = "#{album_params[:original_filename]}"

                #deletando photo de capa
                #photo_delete = Photo.where(album_id: @album.id)
                #photo_delete.delete_all

                Photo.destroy_all(album_id: @album.id, photo_album_cover: true)

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
            status = 'fim da edição'
		    dados << {:status => status, :album => status_album, :album_id => album_id,:photo_cover => photo_capa, :photo_message => photo_message, :photo => photo}
		    render :json => dados
		else
			photo_message = 'erro na hora de salvar o album'
			dados << {:status => status, :album => status_album, :album_id => album_id,:photo_cover => photo_capa, :photo_message => photo_message, :error => @album.errors}
		    render :json => dados
		end
		# respond_to do |format|
		# 	#if @album.update(album_params)

		# 		#format.html { redirect_to @album, notice: 'Album photo was successfully updated.' }
		# 		#format.json { render :show, status: :ok, location: @album }
		# 	else
		# 		format.html { render :edit }
		# 		format.json { render json: @album.errors, status: :unprocessable_entity }
		# 	end
		# end
	end

	# DELETE /albums/1
	# DELETE /albums/1.json
	def destroy
        dados = []
		if @album.destroy
            message = "album deletado com sucesso"
            status = "ok"
        else
            message = "problema para deletar album >> album.id = #{@album.id}"
            status = "não deletado"
        end
        dados << {:status => status, :message => message}
        render :json => dados
		# respond_to do |format|
		# 	format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
		# 	format.json { head :no_content }
		# end
	end

	private
    	# Use callbacks to share common setup or constraints between actions.
	    def set_album
	      @album = Album.find(params[:id])
	    end

		def album_params
	      params.require(:album).permit(
	        :title,
	        :image,
	        :filename,
            :img
	      )
	    end
end
