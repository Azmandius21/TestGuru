# frozen_string_literal: true

module AnswersHelper
  def answer_header(answer)
    key = answer.new_record? ? 'create' : 'edit'
    t( "helpers.answers.#{key}", question: answer.question.body )
  end
end
