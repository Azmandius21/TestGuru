class BaseRuleMethod
  def initialize(user)
    @user = user
    @success_test_passages = @user.test_passages.where(success: true)
  end

  def self.all_methods
    files_rule_methods = []
    Dir.each_child('app/rule_methods') do |x|
      files_rule_methods << x unless x == 'base_rule_method.rb'
    end
    files_rule_methods
  end
end
