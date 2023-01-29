class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to user_post_path(id: current_user.id), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:text).merge(post_id: params[:post_id], author_id: current_user.id)
  end
end
