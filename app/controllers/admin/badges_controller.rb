class Admin:: BadgesController < Admin::BaseController
  def create
    @rule = Rule.all
  end
end