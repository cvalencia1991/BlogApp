class PostsController < ApplicationController
  def index
    @user = User.includes(:posts, posts: [:comments, { comments: [:author] }]).find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new(id: current_user.id)
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_path(current_user), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text).merge(author_id: current_user.id)
  end
end
