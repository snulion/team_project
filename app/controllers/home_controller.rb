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
    post_file = params[:file_name]
    
    uploader = UploadUploader.new
    uploader.store!(post_file)
    
    new_post = Post.new(genre: post_genre, content: post_content, file_name: uploader.url, user_id: current_user.id )
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
  
  def delete
    postid = params[:id]
    userid = current_user.id
    writerid = Post.find(postid).user.id
    
    if userid == writerid
      delete_post = Post.find(postid)
      delete_post.published = false
      delete_post.save
    end
    
    redirect_to "/"
  end
  
  def correct
    postid = params[:id]
    userid = current_user.id
    writerid = Post.find(postid).user.id
    
    @show = Post.where(id: postid)
    @count = @show.take.members.count
  end
  
  def correct_process
    postid = params[:id]
    content = params[:content]
    
    correct_post = Post.find(postid)
    correct_post.content = content
    correct_post.save
    
    redirect_to "/home/show/#{postid}"
  end

  def comment     # Comment 기능 구현
    title = params[:title]
    content = params[:content]
    postid = params[:postid]

    reply = Comment.new(title: title, content: content, post_id: postid, writer: current_user.email)
    reply.save

    # Ajax로 넘기기 위한 변수
    @show_one = Post.where(id: postid).take
  end

  def nokogiri
    songid = params[:song_id]
    @title = Comment.find(songid).title

    ko = URI::encode("#{@title}")
    page = Nokogiri::HTML(open('http://search.bugs.co.kr/track?q='+ ko).read , nil, 'utf-8')


    if page.css('a.trackInfo')[0] != nil
      @nokogiri = page.css('a.trackInfo')[0]['href']

      new_page = Nokogiri::HTML(open("#{@nokogiri}").read , nil, 'utf-8')

        @lylic = new_page.css('div.lyricsContainer').css('p').to_s.html_safe
        @thumnail = new_page.css('img')[0]['src']

    else
        @nokogiri = "검색 결과 없음"
    end
  end
end
