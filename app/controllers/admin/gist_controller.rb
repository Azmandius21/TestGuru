class Admin::GistController < ApplicationController
  def index
    @gist= Gist.all
  end
end
