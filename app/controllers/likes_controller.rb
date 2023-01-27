class LikesController < ApplicationController

  def create
    @like = Like.new(authorid: params[:user_id],postid: params[:id])
    if @like.save
      redirect_to user_posts_path, notice: 'Like was successfully created.'
    else
      redirect_to user_posts_path, alert: 'There was an error creating your like. Please try again.'
    end
  end
end
