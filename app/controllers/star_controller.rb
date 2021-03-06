class StarController < ApplicationController
  def rating
     rating = params[:rating].to_i
     postid = params[:id].to_i
     isnil = Difficulty.where(user_id: current_user.id, post_id: postid)
     if isnil.empty?
       add_score = Difficulty.new(score: rating, user_id: current_user.id, post_id: postid )
       add_score.save
       @jumsoo = add_score.score
     else
       @jumsoo = isnil.take.score
     end
     
     sum = Post.find(postid).difficulties.pluck(:score).sum
     count = Post.find(postid).difficulties.pluck(:score).count
     @avg = sum/count
  end
end
