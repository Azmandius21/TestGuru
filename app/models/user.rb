class User < ApplicationRecord

  def show_passed_tests(level=1)
    Test.joins("JOIN questions ON tests.id = questions.test_id JOIN answers ON questions.id = answers.question_id
      WHERE answers.author_id = #{self.id} AND  tests.level = #{level}")
  end
end
