# frozen_string_literal: true

module TestPassagesHelper
  def detect_class_for_color(test_passage)
    test_passage.success? ? 'high_progress' : 'low_progress'
  end
end
