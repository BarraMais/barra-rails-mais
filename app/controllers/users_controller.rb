class UsersController < ApplicationController
  before_action :authenticate_user!, only: [
    :confirmed_events,
    :user_friends,
    :accept_friendship,
    :refuse_friendship,
    :request_friendship,
    :is_friend_of,
    :pending_friendships,
    :unfriend,
    :index,
    :my_groups,
    :confirmed_groups,
    :pending_groups,
    :refused_groups,
    :accept_group,
    :refuse_group,
    :show,
    :update_user_interests,
    :update_user_nautical_sports,
    :get_nautical_sports_by_user,
    :send_request_to,
    :is_member_of,
    :i_was_invited_to,
    :my_notifications,
    :get_ads_with_starting_id
  ]

  before_action :set_group, only: [
    :send_request_to,
    :is_member_of,
    :i_was_invited_to
  ]

  before_action :set_user, except: [
    :index,
    :friends,
    :confirmed_events,
    :accept_event,
    :event_friends,
    :group_friends,
    :pending_friendships,
    :my_groups,
    :all_groups,
    :confirmed_groups,
    :pending_groups,
    :refused_groups,
    :accept_group,
    :refuse_group,
    :load_nautical_sports,
    :load_state_for_travels,
    :load_country_for_travels,
    :send_request_to,
    :is_member_of,
    :i_was_invited_to,
    :set_group,
    :refuse_event,
    :send_support_email,
    :my_notifications,
    :open_my_notifications,
    :get_ads_with_starting_id
  ]

  def open_my_notifications
    current_user.open_all_notifications
  end

  def get_ads_with_starting_id
    @ads = current_user.advertiser.ads.where("ad_id < ?", params[:id]).order("created_at DESC").limit(2)
  end

  def my_notifications
    @my_notifications = current_user.notifications
  end

  def load_interests
    @interests = @user.interests
  end

  def open_all_user_notifications
    @user.open_all_notifications
  end

  def load_nautical_sports
    @nautical_sports = NauticalSport.all
  end

  def load_state_for_travels
    @state_for_travels = StateForTravel.all
  end

  def load_country_for_travels
    @country_for_travels = CountryForTravel.all
  end

  def event_friends
    event = Event.find(params[:event])
    @event_friends = User.where.not(id: event.all_guests)
  end

  def group_friends
    group = Group.find(params[:group])
    @group_friends = User.where.not(id: group.all_members)
  end

  def user_friends
    @friends = @user.accepted_friendships
  end

  # Updating user interests
  def update_user_interests
    @user.interests = []
    params[:user_interests].each do |interest|
      @user.interests << Interest.find(interest[:id])
    end
    respond_to do |format|
      format.html {}
      format.json do
        user_hash = @user.user_hash
        render json: {user: JWTWrapper.encode(user_hash.as_json) }
      end
    end
  end

  # Updating user nautical sports
  def update_user_nautical_sports
    @user.nautical_sports = []
    params[:user_nautical_sports].each do |nautical_sport|
      @user.nautical_sports << NauticalSport.find(nautical_sport[:id])
    end
  end

  # Get nautical sports by user
  # def get_nautical_sports_by_user
  #   @nautical_sports = NauticalSport.where(user_id: params[:id]).map { |f| f.nautical_sport }
  # end

  # def pending_friends
  #   @pending_friends = current_user.pending_friends.order(:first_name)
  # end

  def accept_friendship
    current_user.accept_friendship_of @user
    response = { status: "Você e " + @user.first_name + " agora são amigos na b+!" }
    respond_for response
  end

  def refuse_friendship
    current_user.refuse_friendship_of @user
    response = { status: "Solicitação de amizade de " + @user.first_name + " recusado com sucesso!" }
    respond_for response
  end

  def request_friendship
    current_user.request_friendship_of @user
    response = { status: "Solicitação de amizade enviada a " + @user.first_name + " com sucesso!" }
    respond_for response
  end

  def is_friend_of
    response = current_user.friend_of? @user
    respond_for response
  end

  def pending_friendships
    @pending_friendships = current_user.pending_friendships
  end

  def unfriend
    current_user.unfriend @user
    response = { status: "Você não é mais amigo de " + @user.first_name + " na b+!" }
    respond_for response
  end

  def respond_for response
    respond_to do |format|
      format.json { render json: response.to_json }
    end
  end

  def user_advertiser
    @user.advertiser
  end

  def save_avatar
    image = Paperclip.io_adapters.for(avatar_params[:image])
    image.original_filename = "#{avatar_params[:filename]}"
    @user.avatar = image

    respond_to do |format|
      if @user.save
        format.html {}
        format.json do
          user_hash = @user.user_hash
          # user_hash.merge!({avatar_url: helpers.asset_url(@user.avatar.url)})
          render json: {user: JWTWrapper.encode(user_hash.as_json) }
        end
      else
        format.html {}
        format.json { render json: {errors: {avatar: ['não foi possível salvar']}}.to_json }
      end
    end
  end

  def save_cover_photo
    image = Paperclip.io_adapters.for(cover_photo_params[:image])
    image.original_filename = "#{cover_photo_params[:filename]}"
    @user.cover_photo = image

    respond_to do |format|
      if @user.save
        format.html {}
        format.json do
          user_hash = @user.user_hash
          # user_hash.merge!({cover_photo_url: helpers.asset_url(@user.cover_photo.url)})
          render json: {user: JWTWrapper.encode(user_hash.as_json) }
        end
      else
        format.html {}
        format.json { render json: {errors: {cover_photo: ['não foi possível salvar']}}.to_json }
      end
    end
  end

  #Event Actions
  def my_events
    @events = @user.events.order(:event_date)
  end

  def confirmed_events
    @events = current_user.confirmed_events.order(:event_date)
  end

  def pending_events
    @events = @user.pending_events.order(:event_date)
  end

  def refused_events
    @events = @user.refused_events.order(:event_date)
  end

  def accept_event
    event = Event.find(params[:event])
    current_user.accept_event(event)
    response = { sucess: "Convite aceito!" }
    respond_for response
  end

  def refuse_event
    event = Event.find(params[:event])
    current_user.refuse_event(event)
    response = { sucess: "Convite recusado!" }
    respond_for response
  end

  #Group Actions
  def my_groups
    @groups = current_user.groups
  end

  def confirmed_groups
    @groups = current_user.confirmed_groups
  end

  def pending_groups
    @groups = current_user.pending_groups
  end

  def refused_groups
    @groups = current_user.refused_groups
  end

  def all_groups
    @groups = Group.all
  end

  def is_member_of
    response = current_user.is_member_of? @group
    @response = { response: response }
    respond_for @response
  end

  def i_was_invited_to
    response = current_user.i_was_invited_to? @group
    @response = { response: response }
    respond_for @response
  end

  def send_request_to
    response = current_user.send_request_to? @group
    @response = { response: response }
    respond_for @response
  end

  def set_group
    @group = Group.find(params[:group])
  end

  def accept_group
    group = Group.find(params[:group])
    current_user.accept_group(group)
    response = { sucess: "Convite aceito!" }
    respond_for response
  end

  def refuse_group
    group = Group.find(params[:group])
    current_user.refuse_group(group)
    response = { sucess: "Convite recusado!" }
    respond_for response
  end

  def index
    @users = User.where.not(id: current_user.id)
  end

  def show

  end

  def send_support_email
    begin
      UserMailer.send_support_email(current_user, params[:message]).deliver
      head :no_content
    rescue => e
      respond_to do |format|
        format.html {}
        format.json { render json: e.message, status: 422 }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :nickname,
      :cellphone,
      :birthday,
      :sex,
      :nautical_professional,
      :nautical_profession_description,
      :academic_profile,
      :relationship,
      :user_id,
      :about,
      :has_embarcation,
      :nautical_work,
      :naval_service,
      :nautical_license,
      :has_nautical_license,
      :profession,
      :work,
      :nautical_tour,
      :fishing,
      :facebook,
      :instagram,
      :twitter,
      :linkedin,
      :website,
      :language,
      :mobile_operator,
      :alternative_email,
      :national_trips,
      :international_trips,
      :cruise_trips,
      :nautical_literature,
      :nautical_application,
      :nautical_brand,
      :fishing_tourist,
      :tourist_places,
      :water_sportsman,
      :fishing_type,
      :sport_list,
      :vessel_list
    )
  end

  def avatar_params
    params.require(:avatar).permit(
    :image,
    :filename
    )
  end

  def cover_photo_params
    params.require(:cover_photo).permit(
    :image,
    :filename
    )
  end
end
