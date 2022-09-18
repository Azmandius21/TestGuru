# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :if_you_are_admin
<<<<<<< Updated upstream
  before_action :find_test, except: %i[index new create]
=======

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
>>>>>>> Stashed changes

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])
    @user = current_user
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end

  def if_you_are_admin
    redirect_to admin_tests_path if current_user.is_a?(Admin)
  end
end
