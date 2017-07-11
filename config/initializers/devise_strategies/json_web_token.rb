require 'jwt_wrapper'
module Devise
  module Strategies
    class JsonWebToken < Base
      def valid?
        request.headers['Authorization'].present?
      end

      def authenticate!
        claim = claims
        return fail! unless claim
        return fail! unless claim.has_key?('id')

        success! User.find_by_id claim['id']
      end

      protected

      def claims
        strategy, token = request.headers['Authorization'].split(' ')
        return nil if (strategy || '').downcase != 'bearer'

        begin
          JWTWrapper.decode(token)
        rescue => e
          puts e
        end
      end
    end
  end
end
