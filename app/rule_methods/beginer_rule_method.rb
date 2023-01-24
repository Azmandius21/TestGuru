class BeginerRuleMethod < BaseRuleMethod
  def work
    @success_test_passages.present? if @user.badges.present? && !@user.badges.find_by(title: 'beginer')
  end
end
