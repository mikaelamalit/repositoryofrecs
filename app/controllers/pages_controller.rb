class PagesController < ApplicationController
  def index
    if params[:tag]
      @recs = Rec.tagged_with(params[:tag])
    else
      @recs = Rec.all
    end
  end

  def about
  end

  def tags
    @recs = Rec.all
  end
end
