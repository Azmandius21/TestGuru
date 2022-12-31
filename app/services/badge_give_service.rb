class BadgeGiveService
  def initialize(user)
    @user = user 
    @rules = Rule.all
    @badges = []
  end

  def create_achievements
   find_available_badges
    @badges.map do |badge|
      Achievement.create!(user: @user, badge: badge)
    end
  end

  def find_available_badges
    @rules.map do |rule| 
      @badges << rule.badge if checking_by_rule(rule.name)  
    end
  end
  
  def checking_by_rule(rule_name)
    rule_method = "#{rule_name.classify}RuleMethod".constantize
    rule_method.new(@user).work
  end
end
