class BaseRuleMethod
  def initialize(user)
    @user = user
    @success_test_passages = @user.test_passages.where(success: true)
  end    
end