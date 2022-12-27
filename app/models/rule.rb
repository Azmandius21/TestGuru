class Rule < ApplicationRecord
  def rule1(user_id)
    tests_success = User.find(user_id).where(success?: true)
    tests_success.present?
  end
end
