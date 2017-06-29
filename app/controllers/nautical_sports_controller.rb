class NauticalSportsController < ApplicationController
  before_action :set_nautical_sport, only: [:show, :edit, :update, :destroy]

  # GET /nautical_sports
  # GET /nautical_sports.json
  def index
    @nautical_sports = NauticalSport.all
  end

  # GET /nautical_sports/1
  # GET /nautical_sports/1.json
  def show
  end

  # Get nautical sports by user
  def get_nautical_sports_by_user
    @nautical_sports = UserNauticalSport.where(user_id: params[:id]).map { |f| f.nautical_sport }
  end

  # GET /nautical_sports/new
  def new
    @nautical_sport = NauticalSport.new
  end

  # GET /nautical_sports/1/edit
  def edit
  end

  # POST /nautical_sports
  # POST /nautical_sports.json
  def create
    @nautical_sport = NauticalSport.new(nautical_sport_params)

    respond_to do |format|
      if @nautical_sport.save
        format.html { redirect_to @nautical_sport, notice: 'Nautical sport was successfully created.' }
        format.json { render :show, status: :created, location: @nautical_sport }
      else
        format.html { render :new }
        format.json { render json: @nautical_sport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nautical_sports/1
  # PATCH/PUT /nautical_sports/1.json
  def update
    respond_to do |format|
      if @nautical_sport.update(nautical_sport_params)
        format.html { redirect_to @nautical_sport, notice: 'Nautical sport was successfully updated.' }
        format.json { render :show, status: :ok, location: @nautical_sport }
      else
        format.html { render :edit }
        format.json { render json: @nautical_sport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nautical_sports/1
  # DELETE /nautical_sports/1.json
  def destroy
    @nautical_sport.destroy
    respond_to do |format|
      format.html { redirect_to nautical_sports_url, notice: 'Nautical sport was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nautical_sport
      @nautical_sport = NauticalSport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nautical_sport_params
      params.require(:nautical_sport).permit(
        :name,
        :photo
      )
    end
end
