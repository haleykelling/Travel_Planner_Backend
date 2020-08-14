class ApplicationController < ActionController::API

    def authenticate
        header = request.headers['Authorization']
        token = header.split(" ")[1]
        if !token 
            render json: {error: "Must be logged in"}, status: :forbidden
        else
            begin
                secret = Rails.application.secret_key_base
                payload = JWT.decode(token, secret)[0]
                @user = User.find(payload['user_id'])
            rescue
                render json: { error: "Must be logged in" }, status: :forbidden 
            end
        end
    end

end
