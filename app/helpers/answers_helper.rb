# frozen_string_literal: true

module AnswersHelper
  def answer_header(answer)
    if answer.new_record?
      "Create new answer on question '#{answer.question.body}'"
    else
      "Edit new answer on question '#{answer.question.body}'"
    end
  end
end
