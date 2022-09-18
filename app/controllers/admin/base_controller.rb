# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_required!

    layout 'admin'

<<<<<<< Updated upstream
    protected

    def admin_required!
      redirect_to root_path, alert: 'You are not authorized to view this page' unless current_user.is_a?(Admin)
    end
=======
  def admin_required!
    redirect_to root_path, alert: 'You are not authorized to view this page' unless current_user.is_a?(Admin)
>>>>>>> Stashed changes
  end
end
