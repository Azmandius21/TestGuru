class BackendRuleMethod < BaseRuleMethod
  def initialize(user)
    super
    @backend_tests = Test.where(category_id: 1)
  end

  def work
    @success_test_passages.where(test_id: @backend_tests.pluck(:id)).count == @backend_tests.count
  end
end
