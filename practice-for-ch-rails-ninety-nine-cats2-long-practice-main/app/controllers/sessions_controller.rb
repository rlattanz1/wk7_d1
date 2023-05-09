class SessionsController < ApplicationController
    before_action :require_logged_out, only: [:new, :create]
    before_action :require_logged_in, only: [:destroy]

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user
            login!(@user)
            redirect_to users_url
        else
            render :new
        end
    end

    def destroy
        # this is our logic for the logout! method
        current_user.reset_session_token!
        session[:session_token] = nil
        redirect_to new_session_url
    end
end
