class User < ApplicationRecord
  def tests_level(tests_level)
    questions_id = Answer.where(author_id: self.id).pluck(:question_id)
    tests_id = Question.where(id: questions_id).pluck(:test_id).uniq
    pp Test.where(id: tests_id).where(level:tests_level)
  end
end
