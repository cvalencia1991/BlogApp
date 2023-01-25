class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.find(params[:user_id])
  end

  def show
    @posts = Post.find(params[:id])
  end
end
