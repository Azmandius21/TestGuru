class Answer < ApplicationRecord
  belongs_to :question

  scope :right, ->{where(correct: true)}

  validates :body, presence: true
  validate :limit_answer_on_question

  private

  def limit_answer_on_question
    num_answ_on_one_quest = Answer.where(question_id: self.question_id).count
    errors.add(:id) unless [1, 2, 3, 4].include?(num_answ_on_one_quest)
  end
end
