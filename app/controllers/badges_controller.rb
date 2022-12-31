require "byebug"
class BadgesController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    @badges = @user.badges
  end
end
