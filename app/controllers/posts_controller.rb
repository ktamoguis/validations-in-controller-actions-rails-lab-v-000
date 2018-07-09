class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def show
  end

  def edit
    #@post = Post.find(params[:id])
  end

  def update
    #binding.pry
    @post.update(post_params)
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      #@post1 = Post.find(params[:id])
      binding.pry
      render edit
    end
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
