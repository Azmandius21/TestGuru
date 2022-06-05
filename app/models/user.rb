class User < ApplicationRecord
  def used_tests(tests_level)
    #tests = Test.where(level: tests_level)
    #questions = tests do |test|
    #  Question.where(test_id: test.id)
    #end
    #answers = questions do |question|
    #  Answer.where(author_id: self.id)
    #end
    # puts self.id
    # answers = Answer.where(author_id: self.id)
    # questions_id = answers.map{|answ| answ.question_id}
    # questions = Question.where(id: questions_id)
    # tests_id = questions.map{|ques| ques.test_id}
    # tests = Test.where(id: ques.test_id, level: test_level)}
    # pp tests
    questions_id = Answer.where(author_id: self.id).ids.uniq
    tests_id = Test.where(level: tests_level).ids
    tests_id.each do |test_id|
      questions_id.map do |question_id|
        tests_id.delete(test_id) unless  Question.find(question_id).test_id == test_id
      end
    end
    puts tests_id
  end

  def my_id
    self.id
  end
end
