# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    key = question.new_record? ? 'create' : 'edit'
    t("helpers.questions.#{key}", test: @question.test.title)
  end
end
