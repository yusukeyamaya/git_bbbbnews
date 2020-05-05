class ContentsController < ApplicationController

  def index
    @contents = Content.page(params[:page]).per(20).order("date DESC")
  end
  
  
end
