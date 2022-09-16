# frozen_string_literal: true

class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
end
