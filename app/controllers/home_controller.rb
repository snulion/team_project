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
    
    new_post = Post.new(genre: post_genre, content: post_content, file_name: post_file, user_id: current_user.id )
    new_post.save
    
    redirect_to :back
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
  
  def show        # 각각의 POST 상세 보기
    if user_signed_in?
      post_id = params[:id]
      @show = Post.where(id: post_id)
      @comment = @show.take.comments.reverse
    else
      redirect_to "/users/sign_in"
    end
  end
  
  def comment     # Comment 기능 구현
    title = params[:title]
    content = params[:content]
    postid = params[:postid]
    
    reply = Comment.new(title: title, content: content, post_id: postid, writer: current_user.email)
    reply.save
    
    respond_to do |format|
      format.js
    end
    
    # redirect_to :back
  end
end
