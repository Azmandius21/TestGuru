# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "Create New Test #{question.test.title} Question"
    else
      "Edit Test #{question.test.title} Question"
    end
  end
end
