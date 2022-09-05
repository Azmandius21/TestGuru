# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if cookies[:target_page].present?
        redirect_to cookies[:target_page]
      else
        redirect_to root_path
      end
      # redirect_to tests_path
    else
      flash.now[:alert] = 'Veryfi email and password'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, alert: 'You have successfully logged out'
  end
end
