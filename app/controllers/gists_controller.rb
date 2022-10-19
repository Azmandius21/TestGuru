class GistsController < ApplicationController
  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    @question = @test_passage.current_question

    result = GistQuestionService.new(@question).call

    flash_message = if result.success?
                      Gist.create!(html_url: result.url,
                                   user_id: @test_passage.user_id,
                                   question_id: @question.id)
                      { notice: t('.success', gist_link: "#{result.url}") }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passage, flash_message
  end
end
