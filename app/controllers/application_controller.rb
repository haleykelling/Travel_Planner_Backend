class ApplicationController < ActionController::API
    def secret
        ENV['SECRET_KEY_BASE']
    end

    def authenticate
        header = request.headers['Authorization']
        token = header.split(" ")[1]
        payload = JWT.decode(token, secret)[0]
        render json: {payload: payload}
        # if !token 
        #     render json: {error: "Must be logged in"}, status: :forbidden
        # else
        #     begin
        #         payload = JWT.decode(token, secret)[0]
        #         @user = User.find(payload['user_id'])
        #     rescue
        #         render json: { error: "Must be logged in" }, status: :forbidden 
        #     end
        # end
    end

end
