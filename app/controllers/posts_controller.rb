class PostsController < ApplicationController
  def index; end

  def show
    @posts = "Here is a list of posts for a given user"
  end
end
