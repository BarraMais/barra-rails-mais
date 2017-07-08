module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    protected
    def find_verified_user
      if request.params[:jwt].present?
        authenticate_with_jwt
      elsif (current_user = env['warden'].user)
        current_user
      else
        reject_unauthorized_connection
      end
    end

    def jwt_decode
      token = request.params[:jwt]
      begin
        JWTWrapper.decode(token)
      rescue => e
        logger.debug e
        false
      end
    end

    def authenticate_with_jwt
      logger.add_tags 'ActionCable', 'With JWT'

      jwt_params = jwt_decode
      reject_unauthorized_connection unless (jwt_params && jwt_params.keys.include?('id'))

      logger.add_tags "User ID: #{jwt_params['id']}"
      User.find jwt_params['id']
    end
  end
end
