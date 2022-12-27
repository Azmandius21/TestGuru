class FirstTryRuleMethod < BaseRuleMethod
  def work
    if @success_test_passages.present?
      @success_test_passages.map do |test_passage|
        @user.test_passages.where(id: test_passage.id).count == 1 ? true : false
      end
    end
  end
end