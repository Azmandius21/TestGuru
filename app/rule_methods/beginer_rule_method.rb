class BeginerRuleMethod < BaseRuleMethod
  def work
    if @user.badges.present?
      unless @user.badges.find_by(name: "beginer")
        @success_test_passages.present?
      end
    end
  end
end