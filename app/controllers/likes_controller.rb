class LikesController < ApplicationController
  def create
    like = Like.new(authorid: current_user.id, postid: params[:post_id])
    return unless like.save

    redirect_to user_path(current_user), notice: 'Like was successfully created.'
  end
end
