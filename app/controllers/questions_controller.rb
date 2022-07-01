class QuestionsController < ApplicationController
  def index
    render json: {quiestions: Question.all}
  end
end
