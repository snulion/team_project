class StarController < ApplicationController
  def rating
     rating = params[:rating].to_i
     postid = params[:id].to_i
     jumsoo = Difficulty.new(score: rating, person: current_user, post_id: postid )
     jumsoo.save
     @jumsoo = jumsoo.score
  end
end
