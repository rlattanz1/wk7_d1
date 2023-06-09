class UsersController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(params[:id])
        if @user.save
            login!(@user)
            redirect_to new_user_url
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password_digest, :session_token)
    end

end
