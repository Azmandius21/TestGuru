class TestsController < ApplicationController
  def new

  end

  def create
    result = ["Class: #{params.class}", "Params: #{params.inspect}"]

    render plain: result.join("\n")
  end
end
