class User::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]
  respond_to :html, :json

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  #Update Resource without password - Inserido por Arthur 26/04
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  # PUT /resource
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
    resource.sport_list = params[:user][:sport_list]
    resource.vessel_list = params[:user][:vessel_list]
    resource_updated = update_resource(resource, account_update_params)
    resource.save_own_vessels(params[:user][:own_vessels_id])
    yield resource if block_given?
    if resource_updated
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      bypass_sign_in resource, scope: resource_name
      # respond_with resource, location: after_update_path_for(resource)
      respond_with resource do |format|
        format.html { redirect_to after_update_path_for(resource) }
        format.json do
          render json: {
            user: JWTWrapper.encode(resource.user_hash)
          }
        end
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [
  #       :first_name,
  #       :last_name,
  #       :cellphone,
  #       :birthday,
  #       :sex,
  #       :nautical_professional,
  #       :academic_profile,
  #       :relationship,
  #       :about,
  #       :has_embarcation,
  #       :nautical_work,
  #       :naval_service
  #     ])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private
  def save_avatar
    image = Paperclip.io_adapters.for(avatar_params[:image])
    image.original_filename = "#{avatar_params[:filename]}"
    @user.avatar = image

    respond_to do |format|
      if @user.save
        format.html {}
        format.json { render json: @user }
      else
        format.html {}
        format.json { render json: {errors: {avatar: ['não foi possível salvar']}}.to_json }
      end
    end
  end

  def avatar_params
    params.require(:avatar).permit(
    :image,
    :filename
    )
  end
end
