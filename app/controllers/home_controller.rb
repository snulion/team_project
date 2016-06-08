require 'nokogiri'
require 'open-uri'


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
    like_user = current_user.id
    post_id = params[:post_id]
    
    isnil = Like.where(user_id: current_user.id, post_id: post_id)
    
    if isnil.empty?
      likeit = Like.new(user_id: like_user, post_id: post_id)
      likeit.save
    else
      isnil.take.destroy
    end
    
    @count = Post.find(post_id).members.count
    @post_id = post_id
  end

  def recorder
  end

  def show        # 각각의 POST 상세 보기
    if user_signed_in?
      post_id = params[:id]
      @show = Post.where(id: post_id)
      @count = @show.take.members.count
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
    
    # Ajax로 넘기기 위한 변수
    @show_one = Post.where(id: postid).take

    ko = URI::encode("#{title}")
    page = Nokogiri::HTML(open('http://search.bugs.co.kr/track?q='+ ko).read , nil, 'utf-8')
    
    if page.css('a.trackInfo')[0] != nil
      @orange = page.css('a.trackInfo')[0]['href']
    end
  end
end
