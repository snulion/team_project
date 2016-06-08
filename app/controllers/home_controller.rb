class HomeController < ApplicationController
  def index
  end
  
  def list
    @posts = Post.all.reverse
  end
end
