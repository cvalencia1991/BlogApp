class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to user_posts_path(current_user), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def comment_params
    @post = Post.find(current_user.id)
    params.require(:comment).permit(:text).merge(authorid: current_user.id, postid: @post.id)
  end
end
