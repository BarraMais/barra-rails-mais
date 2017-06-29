class OwnVesselsController < ApplicationController
  before_action :set_own_vessel, only: [:show, :edit, :update, :destroy]

  # GET /own_vessels
  # GET /own_vessels.json
  def index
    @own_vessels = OwnVessel.all
  end

  # GET /own_vessels/1
  # GET /own_vessels/1.json
  def show
  end

  # GET /own_vessels/new
  def new
    @own_vessel = OwnVessel.new
  end

  # GET /own_vessels/1/edit
  def edit
  end

  # POST /own_vessels
  # POST /own_vessels.json
  def create
    current_user.own_vessels.create(vessel_type_id: params[:vessel_type_id])

    respond_to do |format|
      if @own_vessel.save
        format.html { redirect_to @own_vessel, notice: 'Own vessel was successfully created.' }
        format.json { render :show, status: :created, location: @own_vessel }
      else
        format.html { render :new }
        format.json { render json: @own_vessel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /own_vessels/1
  # PATCH/PUT /own_vessels/1.json
  def update
    respond_to do |format|
      if @own_vessel.update(own_vessel_params)
        format.html { redirect_to @own_vessel, notice: 'Own vessel was successfully updated.' }
        format.json { render :show, status: :ok, location: @own_vessel }
      else
        format.html { render :edit }
        format.json { render json: @own_vessel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /own_vessels/1
  # DELETE /own_vessels/1.json
  def destroy
    @own_vessel.destroy
    respond_to do |format|
      format.html { redirect_to own_vessels_url, notice: 'Own vessel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_own_vessel
      @own_vessel = OwnVessel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def own_vessel_params
      params.fetch(:own_vessel, {})
    end
end
