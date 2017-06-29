class AdsController < ApplicationController
  #O erro era um :interest_list no before action
  before_action :set_ad, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  # GET /ads
  # GET /ads.json
  def index
    @ads = Ad.all
  end

  def respond_for response
    respond_to do |format|
      format.json { render json: response.to_json }
    end
  end

  def interest_list
    @interest_areas = InterestArea.all.order(:name)
  end

  def ad_area
    @ad.area
  end

  # GET /ads/1
  # GET /ads/1.json
  def show
  end

  # GET /ads/new
  def new
    @ad = Ad.new
  end

  # GET /ads/1/edit
  def edit
  end

  # POST /ads
  # POST /ads.json
  def create
    @ad = Ad.new(ad_params)

    respond_to do |format|
      if @ad.save
        format.html { redirect_to @ad, notice: 'Ad was successfully created.' }
        format.json { render json: @ad.to_json }
      else
        format.html { render :new }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ads/1
  # PATCH/PUT /ads/1.json
  def update
    @ad.interest_areas = []
    params[:interest_areas].each do |interest_area|
      @ad.interest_areas << InterestArea.find(interest_area[:id])
    end
    respond_to do |format|
      if @ad.update(ad_params)
        format.html { redirect_to @ad, notice: 'Ad was successfully updated.' }
        format.json { render json: @ad.to_json }
      else
        format.html { render :edit }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ads/1
  # DELETE /ads/1.json
  def destroy
    @ad.destroy
    respond_to do |format|
      format.html { redirect_to ads_url, notice: 'Ad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @ad = Ad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_params
      params.require(:ad).permit(
        :description,
        :area
      )
    end

    def interest_area_params
      params.require(:interest_area).permit(
        :name
      )
    end
end
