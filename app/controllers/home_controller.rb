class HomeController < ApplicationController
  def index
    if user_signed_in?
      @posts = Post.all.reverse
    else
      redirect_to "/users/sign_in"
    end
  end
  
  def post
    post_genre = params[:genre]
    post_content = params[:content]
    post_file = params[:file]
    
    new_post = Post.new(genre: post_genre, content: post_content, file_name: post_file)
    new_post.save
  end
  
  def comments
    
  end
  
  def like
    like_user = params[:like_user]
    post_id = params[:post_id]
    likeit = Like.new(user_id: like_user, post_id: post_id)
    likeit.save
    
    redirect_to :back
  end
  def recorder
  end
end
