# frozen_string_literal: true

module TestPassagesHelper
  def detect_class_for_color(test_passage)
    test_passage.success? ? 'high_progress' : 'low_progress'
  end

  def progress_bar(test_passage)
    progress = (test_passage.number_current_question - 1) * 100 / test_passage.test.questions.count.round
    progress_in_persent = "#{progress}%"
  end

  def gift_badge(test_passage)
    user = test_passage.user
    user.awards << 
  end
end
