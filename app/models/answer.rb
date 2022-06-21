class Answer < ApplicationRecord
  belongs_to :question

  scope :right, ->{where(correct: true)}

  validates :body, presence: true
  validate :validate_limit_answer_on_question

  private

  def validate_limit_answer_on_question
    num_answ_on_one_quest = Answer.where(question_id: self.question_id).count
    errors.add :base, :invalid, message: "Question can have no more 4 answers" if num_answ_on_one_quest >= 4 
  end
end
