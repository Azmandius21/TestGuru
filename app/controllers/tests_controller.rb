class TestsController < ApplicationController

  def index
    #render plain: "Привет Лисонька!"
    #render html: '<h1>All tests</h1>'.html_safe
    #render json: {tests: Test.all}
    #render inline: '<p>My favorit is : <%= %[ybuR].reverse! %>!</p>'
    #render file: 'public/hello', layout: false
    #head :no_content
    #byebug
    #render inline: '<%= console %>'

    logger.info(self.object_id)

    respond_to do |format|
      format.html { render plain: 'All tests' }
      format.json { render json: { tests: Test.all }}
    end
    #byebug
  end

  def start
    render plain: 'start_current_test'
  end

  def show
    #byebug
    redirect_to root_path
  end
end
