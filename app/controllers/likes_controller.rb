class LikesController < ApplicationController
  def create
    @like = Like.new(:user_id, :id)
    if @like.save
      redirect_to user_path(current_user), notice: 'Like was successfully created.'
    else
      redirect_to user_path(current_user), alert: 'There was an error creating your like. Please try again.'
    end
  end
end
