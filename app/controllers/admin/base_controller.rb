# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required!

  def admin_required!
    redirect_to root_path, alert: 'You are not authorized to view this page' unless current_user.is_a?(Admin)
  end
end
