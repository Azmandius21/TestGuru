# frozen_string_literal: true

class ApplicationController < ActionController::Base

  #before_action :configure_permitted_parametrs, if: :devise_controller?

  protect_from_forgery with: :exception

  protected

  def configure_permitted_parametrs
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username, :email)
    end
  end
end
