class UsersController < ApplicationController

    def create
        @user = User.new(user_params)
        if @user.save
            payload = {user_id: @user.id}
            secret = Rails.application.secret_key_base
            token = JWT.encode payload, secret
            render json: { 
                token: token, 
                username: @user.username
            }
        else
            render json: { error: "Invalid request." }, status: :bad_request
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
