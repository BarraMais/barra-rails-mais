class ClassifiedsController < ApplicationController
  before_action :set_classified, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:get_classified_with_starting_id]

  #Resposta JSON Padrão
  def respond_for response, status=200
    respond_to do |format|
      format.json { render json: response.to_json, status: status }
    end
  end

  def get_classifieds_by_user
    response = { classifieds: Classified.where(user_id: params[:id]).order("created_at DESC").limit(2) }
    respond_for response
  end

  def get_classified_with_starting_id
    @classifieds = Classified.where("id < ? AND user_id = ?", params[:id], current_user.id).order("created_at DESC").limit(2)
  end

  def get_vessel_by_classified
    @vessel = Vessel.where(classified_id: params[:id]).first
  end

  def get_fishing_by_classified
    @fishing = Fishing.where(classified_id: params[:id]).first
  end

  def get_product_by_classified
    @product = Product.where(classified_id: params[:id]).first
  end

  def get_vessel_type_by_id
    response = { vessel_type: VesselType.find(params[:id]) }
    respond_for response
  end

  def get_brand_by_id
    response = { brand: Brand.find(params[:id]) }
    respond_for response
  end

  def get_mold_by_id
    response = { mold: Mold.find(params[:id]) }
    respond_for response
  end

  def vessel_types_for_select
    response = { vessel_types: VesselType.all }
    respond_for response
  end

  def brands_for_select
    response = { brands: Brand.where(vessel_type_id: params[:id]) }
    respond_for response
  end

  def molds_for_select
    response = { molds: Mold.where(brand_id: params[:id]).order(:name) }
    respond_for response
  end

  def accessories_for_select
    @accessories = Accessory.where(accessory_type: 0)
  end

  def communications_for_select
    @accessories = Accessory.where(accessory_type: 1)
  end

  def eletronics_for_select
    @accessories = Accessory.where(accessory_type: 2)
  end

  def get_fishing_category_by_id
    response = { fishing_category: FishingCategory.find(params[:id]) }
    respond_for response
  end

  def get_fishing_sub_category_by_id
    response = { fishing_sub_category: FishingSubCategory.find(params[:id]) }
    respond_for response
  end

  def fishing_categories_for_select
    response = { fishing_categories: FishingCategory.all }
    respond_for response
  end

  def fishing_sub_categories_for_select
    response = { fishing_sub_categories: FishingSubCategory.where(fishing_category_id: params[:id]).order(:name) }
    respond_for response
  end

  def get_product_category_by_id
    @product_category = ProductCategory.find(params[:id])
  end

  def get_product_sub_category_by_id
    @product_sub_category = ProductSubCategory.find(params[:id])
  end

  def get_product_sub_category_2_by_id
    @product_sub_category_2 = ProductSubCategory2.find(params[:id])
  end

  def product_categories_for_select
    @product_categories_for_select = ProductCategory.all
  end

  def product_sub_categories_for_select
    @product_sub_categories_for_select = ProductSubCategory.where(product_category_id: params[:id])
  end

  def product_sub_categories_2_for_select
    @product_sub_categories_2_for_select = ProductSubCategory2.where(product_sub_category_id: params[:id])
  end

  def get_all_vessels_by_date
    @vessels = Vessel.all.order("created_at DESC").limit(2)
  end

  def get_vessels_with_starting_id
    @vessels = Vessel.where("id < ?", params[:id]).order("created_at DESC").limit(2)
  end

  def get_all_fishings_by_date
    @fishings = Fishing.all.order("created_at DESC").limit(2)
  end

  def get_fishings_with_starting_id
    @fishings = Fishing.where("id < ?", params[:id]).order("created_at DESC").limit(2)
  end

  def get_all_products_by_date
    @products = Product.all.order("created_at DESC").limit(2)
  end

  def get_products_with_starting_id
    @products = Product.where("id < ?", params[:id]).order("created_at DESC").limit(2)
  end

  # GET /classifieds
  # GET /classifieds.json
  def index
    @classifieds = Classified.all
  end

  # GET /classifieds/1
  # GET /classifieds/1.json
  def show
  end

  # GET /classifieds/new
  def new
    @classified = Classified.new
  end

  # GET /classifieds/1/edit
  def edit
  end

  # POST /classifieds
  # POST /classifieds.json
  def create
    @classified = Classified.new(classified_params)
    respond_to do |format|
      if @classified.save
        format.html { redirect_to @classified, notice: 'Classified was successfully created.' }
        format.json { render :show, status: :created, location: @classified }
      else
        format.html { render :new }
        format.json { render json: @classified.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_vessel
    @classified = Classified.new(classified_params)
    @classified.vessel = Vessel.create(vessel_params)
    params[:accessories].each do |accessory|
      @classified.vessel.accessories << Accessory.find(accessory[:id])
    end
    respond_to do |format|
      if @classified.save
        format.html { redirect_to @classified, notice: 'Classified was successfully created.' }
        format.json { render :show, status: :created, location: @classified }
      else
        format.html { render :new }
        format.json { render json: @classified.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_fishing
    @classified = Classified.new(classified_params)
    @classified.fishing = Fishing.create(fishing_params)
    respond_to do |format|
      if @classified.save
        format.html { redirect_to @classified, notice: 'Classified was successfully created.' }
        format.json { render :show, status: :created, location: @classified }
      else
        format.html { render :new }
        format.json { render json: @classified.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_product
    @classified = Classified.new(classified_params)
    @classified.product = Product.create(product_params)
    respond_to do |format|
      if @classified.save
        format.html { redirect_to @classified, notice: 'Classified was successfully created.' }
        format.json { render :show, status: :created, location: @classified }
      else
        format.html { render :new }
        format.json { render json: @classified.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classifieds/1
  # PATCH/PUT /classifieds/1.json
  def update
    respond_to do |format|
      if @classified.update(classified_params)
        format.html { redirect_to @classified, notice: 'Classified was successfully updated.' }
        format.json { render :show, status: :ok, location: @classified }
      else
        format.html { render :edit }
        format.json { render json: @classified.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_vessel
    @classified = Classified.find(classified_params[:id])
    @classified.vessel.accessories = []
    params[:accessories].each do |accessory|
      @classified.vessel.accessories << Accessory.find(accessory[:id])
    end
    respond_to do |format|
      if @classified.update(classified_params)
        @classified.vessel.update(vessel_params)
        format.html { redirect_to @classified, notice: 'Classified was successfully updated.' }
        format.json { render :show, status: :ok, location: @classified }
      else
        format.html { render :edit }
        format.json { render json: @classified.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_fishing
    @classified = Classified.find(classified_params[:id])
    respond_to do |format|
      if @classified.update(classified_params)
        @classified.fishing.update(fishing_params)
        format.html { redirect_to @classified, notice: 'Classified was successfully updated.' }
        format.json { render :show, status: :ok, location: @classified }
      else
        format.html { render :edit }
        format.json { render json: @classified.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_product
    @classified = Classified.find(classified_params[:id])
    respond_to do |format|
      if @classified.update(classified_params)
        @classified.product.update(product_params)
        format.html { redirect_to @classified, notice: 'Classified was successfully updated.' }
        format.json { render :show, status: :ok, location: @classified }
      else
        format.html { render :edit }
        format.json { render json: @classified.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classifieds/1
  # DELETE /classifieds/1.json
  def destroy
    @classified.destroy
    respond_to do |format|
      format.html { redirect_to classifieds_url, notice: 'Classified was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classified
      @classified = Classified.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classified_params
      params.require(:classified).permit(
        :id,
        :title,
        :document_type,
        :document_number,
        :seller_name,
        :email,
        :landline,
        :cell_phone,
        :description,
        :price,
        :user_id,
        :bonded,
        :classified_conditional
      )
    end

    def vessel_params
      params.require(:vessel).permit(
        :vessel_type_id,
        :status,
        :manufacturation_year,
        :activation_year,
        :alienated,
        :chassis_number,
        :classified_id,
        :mold_id,
        :brand_id
      )
    end

    def fishing_params
      params.require(:fishing).permit(
        :fishing_category_id,
        :fishing_sub_category_id,
        :provisional_category,
        :status,
        :classified_id
      )
    end

    def product_params
      params.require(:product).permit(
        :product_category_id,
        :product_sub_category_id,
        :product_sub_category2_id,
        :status,
        :classified_id
      )
    end
end
