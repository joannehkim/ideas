class IdeasController < ApplicationController
  def index
  	@user = User.find(session[:user_id])
  	@ideas = Idea.all
  end

  def create
  	idea = Idea.new(content: idea_params['content'], user: current_user)

  	if idea.save
  		redirect_to :back
  	end
  end

  def show
    # @users = User.find(params[:id])
    @idea = Idea.find(params[:id])
    @ideas_liked = @idea.users_liked
    # @like_count = Idea.find(:all, :order => 'likes_count desc')
  end

  def destroy
    Idea.find(params[:id]).destroy
    redirect_to :back
  end


  private
  def idea_params
  	params.require(:idea).permit(:content)
  end

end
