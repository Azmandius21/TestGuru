class BadgeController
  def give
    @test_passage_id = TestPassage.find(paramas[:test_passage_id])
    @user = @test_passage.user

    def check_user_for_give_badges
      # take all rules
      # check this user by each rule
      # create pull of avaliable badges
    end

    def give_badges
      gifting = BadgeGiveService.new()
    end

  end
end
