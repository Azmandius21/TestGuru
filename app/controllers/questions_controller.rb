class QuestionsController < ApplicationController
  def index
    render json: {quiestions: Question.all}
  end

  def show
    #byebug
    render json: { questions: Question.find(params['id'].to_i)}
  end

  def new

  end

  def create
    result = ["Class: #{params.class}", "Params: #{params.inspect}"]

    render plain: result.join("\n")
  end
end
