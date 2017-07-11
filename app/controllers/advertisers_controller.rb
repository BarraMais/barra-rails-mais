class AdvertisersController < ApplicationController
  before_action :set_advertiser, only: [:show, :edit, :update, :destroy, :create_ad]

  #Resposta JSON Padrão
  def respond_for response, status=200
    respond_to do |format|
      format.json { render json: response.to_json, status: status }
    end
  end

  def all_ads
    response = {all_ads: @advertiser.all_ads}
    respond_for response
  end

  def advertiser_area
    @advertiser.ad.area
  end

  #Seleção de países
  def country_for_select
    response = { countrys: Country.all }
    respond_for response
  end

  #Seleção de Estados baseado no país selecionado
  def states_for_select
    response = { states: State.where(country_id: params[:id]).order(:name) }
    respond_for response
  end

  #Seleção de Cidades baseado no estado selecionado
  def cities_for_select
    response = { cities: City.where(state_id: params[:id]).order(:name) }
    respond_for response
  end

  def my_address
    @address = @advertiser.address
  end

  # GET /advertisers
  # GET /advertisers.json
  def index
    @advertisers = Advertiser.all
  end

  # GET /advertisers/1
  # GET /advertisers/1.json
  def show
  end

  # GET /advertisers/new
  def new
  end

  # GET /advertisers/1/edit
  def edit
  end

  # POST /advertisers
  # POST /advertisers.json
  def create

    @advertiser = Advertiser.new(advertiser_params)
    @advertiser.create_address(address_params)
    @advertiser.user = current_user

    respond_to do |format|
      if @advertiser.save
        format.html { redirect_to @advertiser, notice: 'Advertiser was successfully created.' }
        format.json { render json: @advertiser.to_json }
      else
        format.html { render :new }
        format.json { render json: @advertiser.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_ad
    ad = Ad.new(ad_params)
    params[:interest_areas].each do |interest_area|
      ad.interest_areas << InterestArea.find(interest_area[:id])
    end
    @advertiser.ads << ad
    respond_to do |format|
      if @advertiser.save
        format.html { redirect_to @ad, notice: 'Ad was successfully created.' }
        format.json { render json: @ad.to_json }
      else
        format.html { render :new }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advertisers/1
  # PATCH/PUT /advertisers/1.json
  def update
    respond_to do |format|
      if @advertiser.update(advertiser_params)
        @advertiser.address.update(address_params)
        format.html { redirect_to @advertiser, notice: 'Advertiser was successfully updated.' }
        format.json { render :show, status: :ok, location: @advertiser }
      else
        format.html { render :edit }
        format.json { render json: @advertiser.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_ad
    #Não está chegando aqui
    ad_t = params[:ad]
    ad = Ad.find(ad_t[:id])
    ad.interest_areas = []
    params[:interest_areas].each do |interest_area|
      ad.interest_areas << InterestArea.find(interest_area[:id])
    end
    respond_to do |format|
      if ad.update
        format.html { redirect_to ad, notice: 'Ad was successfully updated.' }
        format.json { render json: ad.to_json }
      else
        format.html { render :edit }
        format.json { render json: ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advertisers/1
  # DELETE /advertisers/1.json
  def destroy
    @advertiser.destroy
    respond_to do |format|
      format.html { redirect_to advertisers_url, notice: 'Advertiser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advertiser
      @advertiser = Advertiser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advertiser_params
      params.require(:advertiser).permit(
        :document_type,
        :document_number,
        :email,
        :website,
        :facebook,
        :instagram,
        :landline,
        :cell_phone
      )
    end

    def address_params
      params.require(:address).permit(
        :street,
        :complement,
        :neighborhood,
        :city_id,
        :state_id,
        :country_id,
        :zip_code
      )
    end

    def ad_params
      params.require(:ad).permit(
        :description,
        :area
      )
    end

    def interest_area_params
      params.require(:interest_areas).permit(
        :name
      )
    end
end
