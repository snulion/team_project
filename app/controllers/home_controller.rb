class HomeController < ApplicationController
  def index
    @posts = Post.all.reverse
  end
  
  def like
    like_user = params[:like_user]
    post_id = params[:post_id]
    likeit = Like.new(user_id: like_user, post_id: post_id)
    likeit.save
    
    redirect_to :back
  end
end
