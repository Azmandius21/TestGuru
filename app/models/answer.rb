class Answer < ApplicationRecord
  belongs_to :question

  scope :right, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_quantity_answer, on: :create

  private

  def validate_quantity_answer
    errors.add :quantity, message: 'Question can have no more 4 answers' if question.answers.count >= 4
  end
end
