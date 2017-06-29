class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :save_cover_photo, :invitation, :all_guests, :confirmed_guests, :pending_guests, :refused_guests, :is_on_event]
  before_action :authenticate_user!, only: [:create]


  #Resposta JSON Padrão
  def respond_for response, status=200
    respond_to do |format|
      format.json { render json: response.to_json, status: status }
    end
  end

  def all_guests
    response = { all_guests: @event.all_guests }
    respond_for response
  end

  def confirmed_guests
    response = { confirmed_guests: @event.confirmed_guests }
    respond_for response
  end

  def is_on_event
    is_on_event = @event.confirmed_guests.include? current_user
    response = { is_on_event: is_on_event }
    respond_for response
  end

  def pending_guests
    response = { pending_guests: @event.pending_guests }
    respond_for response
  end

  def refused_guests
    response = { refused_guests: @event.refused_guests }
    respond_for response
  end

  #Salvar imagem de capa
  def save_cover_photo event
    image = Paperclip.io_adapters.for(cover_photo_params[:image])
    image.original_filename = "#{cover_photo_params[:filename]}"
    @event.cover_photo = image

    respond_to do |format|
      if @event.save
        format.html {}
        format.json do
          render json: @event
        end
      else
        format.html {}
        format.json { render json: {errors: {cover_photo: ['não foi possível salvar']}}.to_json }
      end
    end
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


  #Convida usuário e retorna lista de convidados atualizada
  def invitation
    begin
      params[:guests].each do |guest|
        @event.guests << User.find(guest[:id])
      end
      response = { guests: @event.guests.order(:first_name) }
      respond_for response
    rescue ActiveRecord::RecordInvalid => e
      response = { error: e.message }
      respond_for response, 409
    rescue e
      response = { error: e.message }
      respond_for response
    end
  end

  #Retorna lista de convidados
  def guests
    response = { guests: @event.guests.order(:first_name) }
    respond_for response
  end

  # GET /events
  # GET /events.json
  def index
    response = { events: Event.all }
    respond_to do |format|
      format.json { render json: response.to_json }
      format.html { render :index }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.create_address(address_params)
    @event.save
    @event.guests << current_user
    current_user.accept_event @event
    image = Paperclip.io_adapters.for(cover_photo_params[:image])
    image.original_filename = "#{cover_photo_params[:filename]}"
    @event.cover_photo = image
    @event
    # respond_to do |format|
    #   if @event.save
    #     @event.guests << current_user
    #     current_user.accept_event @event
    #     save_cover_photo(@event)
    #     format.html { redirect_to @event, notice: 'Event was successfully created.' }
    #     format.json { render @event }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @event.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /events/
  # PATCH/PUT /events/1.json
  def update
    if @event.update(event_params)
      if cover_photo_params[:image]
        image = Paperclip.io_adapters.for(cover_photo_params[:image])
        image.original_filename = "#{cover_photo_params[:filename]}"
        @event.cover_photo = image
      end
      @event.address.update(address_params)
      @event.save
      @event
    else
      @event.errors
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(
        :user_id,
        :name,
        :event_date,
        :about,
        :address_id,
      )
    end

    def cover_photo_params
      params.require(:cover_photo).permit(
        :image,
        :filename
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

    def user_params
      params.require(:user).permit(
        :user_id
      )
    end
end
