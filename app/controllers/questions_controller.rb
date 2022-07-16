class QuestionsController < ApplicationController
  before_action :find_test
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  def index
    render json: {quiestions: Question.all}
  end

  def show
    #byebug
    render json: { questions: Question.find(params[:id].to_i)}
  end

  def new
    @question = @test.questions.new
  end

  def create
    #@question = @test.questions.create(question_params)
    render plain: "Hello!"

  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Question was not found"
  end
end
