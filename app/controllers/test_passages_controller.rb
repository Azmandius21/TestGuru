# frozen_string_literal: true
GIST_URL = 'https://api.github.com/gists'
class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    flash_message = if result.url.include?(GIST_URL)
                      Gist.create(html_url: result.url,
                                  user_id: @test_passage.user.id,
                                  question_id: @test_passage.current_question.id)
                      { notice: t('.success') }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passage, flash_message
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.complited?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
