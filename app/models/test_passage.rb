# frozen_string_literal: true

class TestPassage < ApplicationRecord
  SUCCESS_RATE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: %i[create update]

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.success = true if self.success?
    
    save!
  end

  def complited?
    current_question.nil?
  end

  def progress
    (correct_questions * 100 / test.questions.count.to_f).round(2)
  end

  def success?
    progress >= SUCCESS_RATE
  end

  def number_current_question
    test.questions.index(current_question) + 1
  end

  private

  def before_validation_set_first_question
    if current_question.nil?
      self.current_question = test.questions.first if test.present?
    else
      self.current_question = next_question
    end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.right
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
