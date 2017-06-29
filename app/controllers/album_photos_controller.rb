class AlbumPhotosController < ApplicationController
  before_action :set_album_photo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create]

  # GET /album_photos
  # GET /album_photos.json
  def index
    @album_photos = AlbumPhoto.all
  end

  # GET with conditional
  def get_user_album
    @album_photos = AlbumPhoto.where(user_id: params[:id])
  end

  # GET /album_photos/1
  # GET /album_photos/1.json
  def show
  end

  # GET /album_photos/new
  def new
    @album_photo = AlbumPhoto.new
  end

  # GET /album_photos/1/edit
  def edit
  end

  # POST /album_photos
  # POST /album_photos.json
  def create
    @album_photo = AlbumPhoto.new
    @album_photo.user = current_user
    image = Paperclip.io_adapters.for(photo_params[:image])
    image.original_filename = "#{photo_params[:filename]}"
    @album_photo.photo = image
    @album_photo.save
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

  # PATCH/PUT /album_photos/1
  # PATCH/PUT /album_photos/1.json
  def update
    respond_to do |format|
      if @album_photo.update(album_photo_params)
        format.html { redirect_to @album_photo, notice: 'Album photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @album_photo }
      else
        format.html { render :edit }
        format.json { render json: @album_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /album_photos/1
  # DELETE /album_photos/1.json
  def destroy
    @album_photo.destroy
    respond_to do |format|
      format.html { redirect_to album_photos_url, notice: 'Album photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album_photo
      @album_photo = AlbumPhoto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_photo_params
      params.require(:album_photo).permit(
        :photo
      )
    end

    def photo_params
      params.require(:photo).permit(
        :image,
        :filename
      )
    end


end
