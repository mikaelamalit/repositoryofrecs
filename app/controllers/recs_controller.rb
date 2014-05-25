class RecsController < ApplicationController
    before_action :authenticate_user!
  def new
    @rec = Rec.new
  end

  def edit
    @rec = Rec.find(params[:id])
  end

  def index
  	if params[:tag]
    	@recs = Rec.tagged_with(params[:tag])
  	else
    	@recs = current_user.recs
    end
  end

  def create
    @rec = Rec.new
    @rec.content = params[:rec][:content]
    @rec.user = current_user
    @rec.posted_on = DateTime.now
    @rec.tag_list = params[:rec][:tag_list]
    @rec.save!
    redirect_to :action => :index
  end

  def show
    @rec = Rec.find(params[:id])
  end

  def update
    @rec = Rec.find(params[:id])
    @rec.content = params[:rec][:content]
    @rec.user = current_user
    @rec.posted_on = DateTime.now
    @rec.tag_list = params[:rec][:tag_list]
    @rec.save!
    flash[:notice] = "#{@rec.id} is updated."
    redirect_to :action => :index
  end

  def destroy
    @rec = Rec.find(params[:id])
    @rec.destroy!
    redirect_to :action => :index
  end

  private

	def person_params
	  # It's mandatory to specify the nested attributes that should be whitelisted.
	  # If you use `permit` with just the key that points to the nested attributes hash,
	  # it will return an empty hash.
	  params.require(:rec).permit(:content, :name, :tag_list, :posted_on)
	end
end
