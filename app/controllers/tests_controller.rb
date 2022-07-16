class TestsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  def index
    @test = Test.all
    render plain: @test.inspect
  end

  def show
    @test = Test.find(params[:id])
  end

  def create
    @test = Test.create(test_params)
  end

  private

  def test_params
    params.require(:test).permit( :title, :level )
  end

  def rescue_with_test_not_found
    render plain: "Test was not found"
  end
end
