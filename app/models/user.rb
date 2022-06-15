class User < ApplicationRecord

  def show_passed_tests(level=1)
    Test.joins('JOIN questions
                ON tests.id = questions.test_id
                JOIN answers
                ON questions.id = answers.question_id')
        .where('answers.author_id =?', self.id)
        .where('tests.level = ?', level)
  end
end
