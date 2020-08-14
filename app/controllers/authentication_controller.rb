class AuthenticationController < ApplicationController

    def login
        @user = User.find_by(username: params[:user][:username])
        if !@user || !@user.authenticate(params[:user][:password]) 
            render json: { error: "Wrong username or password" }, status: :unauthorized
        else
            payload = { user_id: @user.id }
            token = JWT.encode payload, secret 
            render json: {
                token: token,
                name: @user.username
            }
        end
    end

end
