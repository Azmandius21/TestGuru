# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :find_test, except: %i[index new create]
  before_action :find_tests, only: %i[index update_inline]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index; end

  def show; end

  def new
    @test = Test.new
  end

  def edit; end

  def create
    @test = current_user.created_tests.create(test_params)

    if @test.save
      redirect_to admin_test_path(@test), notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_tests
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :limit_time, :duration_time)
  end

  def rescue_with_test_not_found
    render plain: t('.not_found')
  end
end
