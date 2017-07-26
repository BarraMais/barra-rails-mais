class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, if: ->{request.format.json?}

  # protect_from_forgery with: :null_session
  before_action :verified_request?
  before_action :configure_permitted_parameters, if: :devise_controller?
  respond_to :html, :json
  before_action :authenticate_user!, only: [:devise_token]

  include CanCan::ControllerAdditions

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to main_app.root_url, :notice => exception.message }
    end
  end

  def authenticate_admin
    authenticate_user!
    unless(current_user.has_role?(:administrator))
      redirect_to root_path, notice: current_user.first_name + ', você não está autorizado a acessar esta página, deslogue e entre com um usuário administrador.'
    end
  end

  def devise_token
    raw, enc = Devise.token_generator.generate(current_user.class, :reset_password_token)
    current_user.reset_password_token = enc
    current_user.reset_password_sent_at = Time.now.utc
    current_user.save(validate: false)

    render json: {devise_token: JWTWrapper.encode({raw: raw})}
  end

  private

  def verified_request?
    if request.content_type == "application/json"
      true
    else
      super
    end
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
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
        :naval_service_patent,
        :nautical_license,
        :license_interest,
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
        :fishing_type
      ])
    devise_parameter_sanitizer.permit(:account_update, keys: [
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
        :naval_service_patent,
        :nautical_license,
        :license_interest,
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
        :fishing_type
      ])
  end
end
