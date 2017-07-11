class InterestAreasController < ApplicationController
  before_action :set_interest_area, only: [:show, :edit, :update, :destroy]

  # GET /interest_areas
  # GET /interest_areas.json
  def index
    @interest_areas = InterestArea.all
  end

  # GET /interest_areas/1
  # GET /interest_areas/1.json
  def show
  end

  # GET /interest_areas/new
  def new
    @interest_area = InterestArea.new
  end

  # GET /interest_areas/1/edit
  def edit
  end

  # POST /interest_areas
  # POST /interest_areas.json
  def create
    @interest_area = InterestArea.new(interest_area_params)

    respond_to do |format|
      if @interest_area.save
        format.html { redirect_to @interest_area, notice: 'Interest area was successfully created.' }
        format.json { render :show, status: :created, location: @interest_area }
      else
        format.html { render :new }
        format.json { render json: @interest_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interest_areas/1
  # PATCH/PUT /interest_areas/1.json
  def update
    respond_to do |format|
      if @interest_area.update(interest_area_params)
        format.html { redirect_to @interest_area, notice: 'Interest area was successfully updated.' }
        format.json { render :show, status: :ok, location: @interest_area }
      else
        format.html { render :edit }
        format.json { render json: @interest_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interest_areas/1
  # DELETE /interest_areas/1.json
  def destroy
    @interest_area.destroy
    respond_to do |format|
      format.html { redirect_to interest_areas_url, notice: 'Interest area was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interest_area
      @interest_area = InterestArea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interest_area_params
      params.require(:interest_area).permit(:name, :photo)
    end
end
